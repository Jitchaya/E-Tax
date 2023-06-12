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
            DataClassification = ToBeClassified;
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
        field(6; RequestBody; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Saved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Output; Text[2048])
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
        APIResponse: Record "API Response";
    begin
        if APIResponse.FindLast() then
            EntryNo := APIResponse.EntryNo + 1
        else
            EntryNo := 1;
        "Authorization Type" := "Authorization Type"::"No Auth";
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