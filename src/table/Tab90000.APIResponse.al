table 90000 "API Response"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; Method; Enum Methods)
        {
            DataClassification = ToBeClassified;
        }
        field(3; URL; Text[2048])
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;
        }
        field(4; "Authorization Type"; Enum "Authorization Type")
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Content-Type"; Enum "Content-Type")
        {
            Caption = 'Content-Type';
            DataClassification = ToBeClassified;
        }
        field(6; "Content Format"; Enum "Content Format")
        {
            Caption = 'Content Format';
            DataClassification = ToBeClassified;
        }
        field(7; Response; Blob)
        {
            /*trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;*/
        }
        field(8; Saved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Output; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10; ETaxID; Integer)
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;
        }
        field(11; InvoiceNumber; Code[10])
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;
        }
        field(12; JsonBody; Blob)
        {
        }
    }
    keys
    {
        key(Key1; EntryNo)
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;

    trigger OnInsert()
    var
        tblAPIResponse: Record "API Response";
    begin
        /*if tblAPIResponse.FindLast() then
            EntryNo := tblAPIResponse.EntryNo + 1
        else
            EntryNo := 1;
        "Authorization Type" := "Authorization Type"::"No Auth";*/
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

    procedure SetResponseBlob(p_Response: Text)
    var
        OutStream: OutStream;
    begin
        Clear(Response);
        Response.CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(p_Response);
        //Modify();
    end;

    procedure GetResponseBlob() m_Response: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("Response");
        Response.CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), FieldName(Response)));
    end;

    procedure SetJsonBodyBlob(p_JsonBody: Text)
    var
        OutStream: OutStream;
    begin
        Clear(JsonBody);
        JsonBody.CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(p_JsonBody);
    end;

    procedure GetJsonBodyBlob() m_JsonBody: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields(JsonBody);
        JsonBody.CreateInStream(InStream, TEXTENCODING::UTF8);
        exit(TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), FieldName(JsonBody)));
    end;
}