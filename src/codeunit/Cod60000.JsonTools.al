codeunit 60000 "Json Tools"
{
    procedure Json2Rec(JO: JsonObject; Rec: Variant): Variant
    var
        Ref: RecordRef;
    begin
        Ref.GetTable(Rec);
        exit(Json2Rec(JO, Ref.Number()));
    end;

    procedure Json2Rec(JO: JsonObject; TableNo: Integer): Variant
    var
        Ref: RecordRef;
        FR: FieldRef;
        FieldHash: Dictionary of [Text, Integer];
        i: Integer;
        JsonKey: Text;
        T: JsonToken;
        JsonKeyValue: JsonValue;
        RecVar: Variant;
    begin
        Ref.OPEN(TableNo);
        for i := 1 to Ref.FieldCount() do begin
            FR := Ref.FieldIndex(i);
            FieldHash.Add(GetJsonFieldName(FR), FR.Number);
        end;
        Ref.Init();
        foreach JsonKey in JO.Keys() do begin
            if JO.Get(JsonKey, T) then begin
                if T.IsValue() then begin
                    JsonKeyValue := T.AsValue();
                    FR := Ref.Field(FieldHash.Get(JsonKey));
                    AssignValueToFieldRef(FR, JsonKeyValue);
                end;
            end;
        end;
        RecVar := Ref;
        exit(RecVar);
    end;

    procedure Rec2Json(Rec: Variant; p_startIteration: Integer): JsonObject
    var
        Ref: RecordRef;
        Out: JsonObject;
        FRef: FieldRef;
        i: Integer;
    begin
        if not Rec.IsRecord then
            error('Parameter Rec is not a record');
        Ref.GetTable(Rec);
        for i := p_startIteration to Ref.FieldCount() do begin
            FRef := Ref.FieldIndex(i);
            case FRef.Class of
                FRef.Class::Normal:
                    Out.Add(GetJsonFieldName(FRef), FieldRef2JsonValue(FRef));
                FRef.Class::FlowField:
                    begin
                        FRef.CalcField();
                        Out.Add(GetJsonFieldName(FRef), FieldRef2JsonValue(FRef));
                    end;
            end;
        end;
        exit(Out);
    end;

    local procedure FieldRef2JsonValue(FRef: FieldRef): JsonValue
    var
        V: JsonValue;
        D: Date;
        DT: DateTime;
        T: Time;
        B: Boolean;
    begin
        case FRef.Type() of
            FieldType::Date:
                begin
                    D := FRef.Value;
                    V.SetValue(D);
                end;
            FieldType::Time:
                begin
                    T := FRef.Value;
                    V.SetValue(T);
                end;
            FieldType::DateTime:
                begin
                    DT := FRef.Value;
                    V.SetValue(DT);
                end;
            fieldType::Boolean:
                begin
                    B := FRef.Value;
                    V.SetValue(B);
                end;
            else
                V.SetValue(Format(FRef.Value, 0, 9));
        end;
        exit(v);
    end;

    local procedure GetJsonFieldName(FRef: FieldRef): Text
    var
        Name: Text;
        i: Integer;
    begin
        Name := FRef.Name();
        for i := 1 to Strlen(Name) do begin
            if Name[i] < '0' then
                Name[i] := '_';
        end;
        exit(Name.Replace('__', '_').TrimEnd('_').TrimStart('_'));
    end;

    local procedure AssignValueToFieldRef(var FR: FieldRef; JsonKeyValue: JsonValue)
    begin
        case FR.Type() of
            FieldType::Code,
            FieldType::Text:
                FR.Value := JsonKeyValue.AsText();
            FieldType::Integer:
                FR.Value := JsonKeyValue.AsInteger();
            FieldType::Date:
                FR.Value := JsonKeyValue.AsDate();
            else
                error('%1 is not a supported field type', FR.Type());
        end;
    end;

    //Complex API Json
    procedure API2Json(id: Integer): JsonObject
    var
        API: Record "API Setup";
        JO: JsonObject;
    begin
        API.Get(id);
        JO.Add('SellerTaxId', API.SellerTaxId);
        JO.Add('SellerBranchId', API.SellerBranchId);
        JO.Add('UserCode', API.UserCode);
        JO.Add('AccessKey', API.AccessKey);
        JO.Add('APIKey', API.APIKey);
        JO.Add('ServiceCode', API.ServiceCode);
        JO.Add('TextContent', Tasks2Json(API.idHeader));
        JO.Add('PDFContent', API.PDFContent);
        exit(JO);
    end;

    procedure Tasks2Json(LINEID: Integer): JsonObject
    var
        Task: Record "API Body";
        Line: Record "API Line";
        JA: JsonArray;
        JO: JsonObject;
        J2: JsonObject;
    //Tools: Codeunit "Json Tools";
    begin
        Task.Setrange(idHeader, LINEID);
        if Task.FindSet() then
            repeat
                Line.SetRange(idHeader, LINEID);
                Line.SetRange(idBody, Task.idBody);
                JO := Rec2Json(Task, 3);
                JO.Add('LINE_ITEM_INFORMATION', Line2Json(Task));
            //JA.Add(JO);
            until Task.Next() = 0;
        exit(JO);
    end;

    procedure Line2Json(Task: Record "API Body"): JsonArray
    var
        JA: JsonArray;
        JLE: Record "API Line";
    //Tools: Codeunit "Json Tools";
    begin
        JLE.Setrange("idBody", Task.idBody);
        JLE.Setrange("idHeader", Task.idHeader);
        if JLE.FindSet() then
            repeat
                JA.Add(Rec2Json(JLE, 4));
            until JLE.Next() = 0;
        exit(JA);
    end;
}
