table 50000 "API Setup"
{
    /*DataPerCompany = true;
    LookupPageId = 70000;
    DrillDownPageId = 70000;*/
    //Permissions = TableData "APITableHeader" = m;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        /*field(1; idHeader; Integer)
        {
            Caption = 'idHeader';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }*/
        field(2; "Content-Type"; Text[250])
        {
            Caption = 'Content-Type';
            DataClassification = ToBeClassified;
            //InitValue = 'application/json';
            /*trigger OnValidate()
            var
                APITest: Codeunit "Etax API";
            begin
                APITest.CallAPI();
            end;*/
        }
        field(3; "Authorization"; Text[250])
        {
            Caption = 'Authorization';
            DataClassification = ToBeClassified;
            //InitValue = '4';
            /*trigger OnValidate()
            var
                APITest: Codeunit "Etax API";
            begin
                APITest.CallAPI();
            end;*/
        }
        field(4; "SellerTaxId"; Text[250])
        {
            Caption = 'SellerTaxId';
            DataClassification = ToBeClassified;
            //InitValue = '';

        }
        field(5; "SellerBranchId"; Text[250])
        {
            Caption = 'SellerBranchId';
            DataClassification = ToBeClassified;
            //InitValue = '00000';
        }
        field(6; "APIKey"; Text[250])
        {
            Caption = 'APIKey';
            DataClassification = ToBeClassified;
            //InitValue = '5';
        }
        field(7; "UserCode"; Text[250])
        {
            Caption = 'UserCode';
            DataClassification = ToBeClassified;
            //InitValue = '';
        }
        field(8; "AccessKey"; Text[250])
        {
            Caption = 'AccessKey';
            DataClassification = ToBeClassified;
            //InitValue = 'P@ssw0rd';
        }
        field(9; "ServiceCode"; Text[250])
        {
            Caption = 'ServiceCode';
            DataClassification = ToBeClassified;
            //InitValue = 'S03';
        }
        field(10; "TextContent"; Text[250])
        {
            Caption = 'TextContent';
            DataClassification = ToBeClassified;
            //InitValue = '';
        }
        field(11; "PDFContent"; Text[250])
        {
            Caption = 'PDFContent';
            DataClassification = ToBeClassified;
            //InitValue = '';
        }
        field(12; Method; Enum Methods)
        {
            Caption = 'Method';
            DataClassification = ToBeClassified;
            //InitValue = '';
        }
        field(13; URL; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Authorization Type"; Enum "Authorization Type")
        {
            DataClassification = ToBeClassified;
        }
        field(15; Saved; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; Output; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}