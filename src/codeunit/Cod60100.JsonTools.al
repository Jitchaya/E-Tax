codeunit 60100 "Json Tools"
{
    procedure z_Json2Rec(p_JsonObj: JsonObject; p_Rec: Variant): Variant
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(p_Rec);
        exit(z_Json2Rec(p_JsonObj, RecRef.Number()));
    end;

    procedure z_Json2Rec(p_JsonObj: JsonObject; p_tblNo: Integer): Variant
    var
        RecRef: RecordRef;
        FieldRef: FieldRef;
        FieldHash: Dictionary of [Text, Integer];
        i: Integer;
        gJsonKey: Text;
        JsonToken: JsonToken;
        JsonKeyValue: JsonValue;
        RecVariant: Variant;
    begin
        RecRef.OPEN(p_tblNo);
        for i := 1 to RecRef.FieldCount() do begin
            FieldRef := RecRef.FieldIndex(i);
            FieldHash.Add(z_GetJsonFieldName(FieldRef), FieldRef.Number);
        end;
        RecRef.Init();
        foreach gJsonKey in p_JsonObj.Keys() do begin
            if p_JsonObj.Get(gJsonKey, JsonToken) then begin
                if JsonToken.IsValue() then begin
                    JsonKeyValue := JsonToken.AsValue();
                    FieldRef := RecRef.Field(FieldHash.Get(gJsonKey));
                    z_AssignValueToFieldRef(FieldRef, JsonKeyValue);
                end;
            end;
        end;
        RecVariant := RecRef;
        exit(RecVariant);
    end;

    procedure z_Rec2Json(p_Rec: Variant; p_startIteration: Integer): JsonObject
    var
        RecRef: RecordRef;
        JsonObjOut: JsonObject;
        FieldRef: FieldRef;
        i: Integer;
    begin
        if not p_Rec.IsRecord then
            error('Parameter Rec is not a record');
        RecRef.GetTable(p_Rec);
        for i := p_startIteration to RecRef.FieldCount() do begin
            FieldRef := RecRef.FieldIndex(i);
            case FieldRef.Class of
                FieldRef.Class::Normal:
                    JsonObjOut.Add(z_GetJsonFieldName(FieldRef), z_FieldRef2JsonValue(FieldRef));
                FieldRef.Class::FlowField:
                    begin
                        FieldRef.CalcField();
                        JsonObjOut.Add(z_GetJsonFieldName(FieldRef), z_FieldRef2JsonValue(FieldRef));
                    end;
            end;
        end;
        exit(JsonObjOut);
    end;

    local procedure z_FieldRef2JsonValue(p_FieldRef: FieldRef): JsonValue
    var
        JsonVal: JsonValue;
        dDate: Date;
        dDateTime: DateTime;
        dTime: Time;
        qBoolean: Boolean;
    begin
        case p_FieldRef.Type() of
            FieldType::Date:
                begin
                    dDate := p_FieldRef.Value;
                    JsonVal.SetValue(dDate);
                end;
            FieldType::Time:
                begin
                    dTime := p_FieldRef.Value;
                    JsonVal.SetValue(dTime);
                end;
            FieldType::DateTime:
                begin
                    dDateTime := p_FieldRef.Value;
                    JsonVal.SetValue(dDateTime);
                end;
            fieldType::Boolean:
                begin
                    qBoolean := p_FieldRef.Value;
                    JsonVal.SetValue(qBoolean);
                end;
            else
                JsonVal.SetValue(Format(p_FieldRef.Value, 0, 9));
        end;
        exit(JsonVal);
    end;

    local procedure z_GetJsonFieldName(p_FieldRef: FieldRef): Text
    var
        gName: Text;
        i: Integer;
    begin
        gName := p_FieldRef.Name();
        /*for i := 1 to Strlen(gName) do begin
            if gName[i] = ' ' then
                //gName[i] := '_';
                gName[i] := '_';
        end;*/

        //exit(gName.Replace('__', '_').TrimEnd('_').TrimStart('_'));
        exit(gName);
    end;

    local procedure z_AssignValueToFieldRef(var p_FieldRef: FieldRef; p_JsonKeyValue: JsonValue)
    begin
        case p_FieldRef.Type() of
            FieldType::Code,
            FieldType::Text:
                p_FieldRef.Value := p_JsonKeyValue.AsText();
            FieldType::Integer:
                p_FieldRef.Value := p_JsonKeyValue.AsInteger();
            FieldType::Date:
                p_FieldRef.Value := p_JsonKeyValue.AsDate();
            else
                error('%1 is not a supported field type', p_FieldRef.Type());
        end;
    end;

    //Complex API Json
    procedure z_API2Json(p_id: Code[10]): JsonObject
    var
        tblAPISetup: Record "API Setup";
        JsonObj: JsonObject;
        cuTextFile: Codeunit "TextFile";
    begin
        tblAPISetup.Get();
        JsonObj.Add('SellerTaxId', tblAPISetup.SellerTaxId);
        JsonObj.Add('SellerBranchId', tblAPISetup.SellerBranchId);
        JsonObj.Add('APIKey', tblAPISetup.APIKey);
        JsonObj.Add('UserCode', tblAPISetup.UserCode);
        JsonObj.Add('AccessKey', tblAPISetup.AccessKey);
        JsonObj.Add('ServiceCode', tblAPISetup.ServiceCode);
        JsonObj.Add('TextContent', z_Tasks2Json(tblAPISetup."Primary Key"));
        //JsonObj.Add('PDFContent', tblAPISetup.PDFContent);
        JsonObj.Add('PDFContent', cuTextFile.SendText());
        exit(JsonObj);
    end;

    procedure z_Tasks2Json(LINEID: Code[10]): JsonObject
    var
        tblAPIBody: Record "API Body";
        tblAPILine: Record "API Line";
        JsonObj: JsonObject;
    begin
        tblAPIBody.Setrange("Primary Key", LINEID);
        if tblAPIBody.FindSet() then
            repeat
                tblAPILine.SetRange("Primary Key", LINEID);
                tblAPILine.SetRange(idBody, tblAPIBody.idBody);
                JsonObj := z_Rec2Json(tblAPIBody, 3);
                JsonObj.Add('LINE_ITEM_INFORMATION', z_Line2Json(tblAPIBody));
            //JsonArr.Add(JsonObj);
            until tblAPIBody.Next() = 0;
        exit(JsonObj);
    end;

    procedure z_Line2Json(tblAPIBody: Record "API Body"): JsonArray
    var
        JsonArr: JsonArray;
        tblAPILine: Record "API Line";
    begin
        tblAPILine.Setrange("idBody", tblAPIBody.idBody);
        tblAPILine.Setrange("Primary Key", tblAPIBody."Primary Key");
        if tblAPILine.FindSet() then
            repeat
                JsonArr.Add(z_Rec2Json(tblAPILine, 4));
            until tblAPILine.Next() = 0;
        exit(JsonArr);
    end;
}
