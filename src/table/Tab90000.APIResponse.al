table 90000 "API Response"
{
    DataClassification = ToBeClassified;
    fields
    {
        field(1; EntryNo; Integer)
        {
            DataClassification = ToBeClassified;
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
        field(7; Response; Text[2048]/*Blob*/)
        {
            trigger OnValidate()
            var
                myInt: Integer;
            begin

            end;
        }
        field(8; Saved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; Output; Text[2048])
        {
            DataClassification = ToBeClassified;
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
        if tblAPIResponse.FindLast() then
            EntryNo := tblAPIResponse.EntryNo + 1
        /*else
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

}