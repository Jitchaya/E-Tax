table 70000 "API Line"
{
    Caption = 'TextContent';
    // DrillDownPageID = "TableLine";
    //LookupPageID = "TableLine";
    Permissions = TableData "API Line" = m;
    DataClassification = ToBeClassified;
    fields
    {
        field(1; idLine; Integer)
        {
            Caption = 'idLine';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        /*field(2; idHeader; Integer)
        {
            Caption = 'idHeader';
            DataClassification = ToBeClassified;
            TableRelation = "API Setup".idHeader;
        }*/
        field(2000000; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
            TableRelation = "API Setup"."Primary Key";
        }
        field(3000000; idBody; Integer)
        {
            Caption = 'idBody';
            DataClassification = ToBeClassified;
            TableRelation = "API Body".idBody;
        }
        field(3; "L01-LINE_ID"; Text[250])
        {
            Caption = 'L01-LINE_ID';
            DataClassification = ToBeClassified;
        }
        field(6; "L02-PRODUCT_ID"; Text[250])
        {
            Caption = 'L02-PRODUCT_ID';
            DataClassification = ToBeClassified;
        }
        field(5; "L03-PRODUCT_NAME"; Text[250])
        {
            Caption = 'L03-PRODUCT_NAME';
            DataClassification = ToBeClassified;
        }
        field(7; "L04-PRODUCT_DESC"; Text[250])
        {
            Caption = 'L04-PRODUCT_DESC';
            DataClassification = ToBeClassified;
        }
        field(8; "L05-PRODUCT_BATCH_ID"; Text[250])
        {
            Caption = 'L05-PRODUCT_BATCH_ID';
            DataClassification = ToBeClassified;
        }
        field(9; "L06-PRODUCT_EXPIRE_DTM"; Text[250])
        {
            Caption = 'L06-PRODUCT_EXPIRE_DTM';
            DataClassification = ToBeClassified;
        }
        field(10; "L07-PRODUCT_CLASS_CODE"; Text[250])
        {
            Caption = 'L07-PRODUCT_CLASS_CODE';
            DataClassification = ToBeClassified;
        }
        field(11; "L08-PRODUCT_CLASS_NAME"; Text[250])
        {
            Caption = 'L08-PRODUCT_CLASS_NAME';
            DataClassification = ToBeClassified;
        }
        field(12; "L09-PRODUCT_ORIGIN_COUNTRY_ID"; Text[250])
        {
            Caption = 'L09-PRODUCT_ORIGIN_COUNTRY_ID';
            DataClassification = ToBeClassified;
        }
        field(13; "L10-PRODUCT_CHARGE_AMOUNT"; Text[250])
        {
            Caption = 'L10-PRODUCT_CHARGE_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(14; "L11-PRODUCT_CHARGE_CURRENCY_CODE"; Text[250])
        {
            Caption = 'L11-PRODUCT_CHARGE_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(15; "L12-PRODUCT_ALLOWANCE_CHARGE_IND"; Text[250])
        {
            Caption = 'L12-PRODUCT_ALLOWANCE_CHARGE_IND';
            DataClassification = ToBeClassified;
        }
        field(16; "L13-PRODUCT_ALLOWANCE_ACTUAL_AMOUNT"; Text[250])
        {
            Caption = 'L13-PRODUCT_ALLOWANCE_ACTUAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(17; "L14-PRODUCT_ALLOWANCE_ACTUAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'L14-PRODUCT_ALLOWANCE_ACTUAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(18; "L15-PRODUCT_ALLOWANCE_REASON_CODE"; Text[250])
        {
            Caption = 'L15-PRODUCT_ALLOWANCE_REASON_CODE';
            DataClassification = ToBeClassified;
        }
        field(19; "L16-PRODUCT_ALLOWANCE_REASON"; Text[250])
        {
            Caption = 'L16-PRODUCT_ALLOWANCE_REASON';
            DataClassification = ToBeClassified;
        }
        field(20; "L17-PRODUCT_QUANTITY"; Text[250])
        {
            Caption = 'L17-PRODUCT_QUANTITY';
            DataClassification = ToBeClassified;
        }
        field(21; "L18-PRODUCT_UNIT_CODE"; Text[250])
        {
            Caption = 'L18-PRODUCT_UNIT_CODE';
            DataClassification = ToBeClassified;
        }
        field(22; "L19-PRODUCT_QUANTITY_PER_UNIT"; Text[250])
        {
            Caption = 'L19-PRODUCT_QUANTITY_PER_UNIT';
            DataClassification = ToBeClassified;
        }
        field(23; "L20-LINE_TAX_TYPE_CODE"; Text[250])
        {
            Caption = 'L20-LINE_TAX_TYPE_CODE';
            DataClassification = ToBeClassified;
        }
        field(24; "L21-LINE_TAX_CAL_RATE"; Text[250])
        {
            Caption = 'L21-LINE_TAX_CAL_RATE';
            DataClassification = ToBeClassified;
        }
        field(25; "L22-LINE_BASIS_AMOUNT"; Text[250])
        {
            Caption = 'L22-LINE_BASIS_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(26; "L23-LINE_BASIS_CURRENCY_CODE"; Text[250])
        {
            Caption = 'L23-LINE_BASIS_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(27; "L24-LINE_TAX_CAL_AMOUNT"; Text[250])
        {
            Caption = 'L24-LINE_TAX_CAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(28; "L25-LINE_TAX_CAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'L25-LINE_TAX_CAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(29; "L26-LINE_ALLOWANCE_CHARGE_IND"; Text[250])
        {
            Caption = 'L26-LINE_ALLOWANCE_CHARGE_IND';
            DataClassification = ToBeClassified;
        }
        field(30; "L27-LINE_ALLOWANCE_ACTUAL_AMOUNT"; Text[250])
        {
            Caption = 'L27-LINE_ALLOWANCE_ACTUAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(31; "L28-LINE_ALLOWANCE_ACTUAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'L28-LINE_ALLOWANCE_ACTUAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(32; "L29-LINE_ALLOWANCE_REASON_CODE"; Text[250])
        {
            Caption = 'L29-LINE_ALLOWANCE_REASON_CODE';
            DataClassification = ToBeClassified;
        }
        field(33; "L30-LINE_ALLOWANCE_REASON"; Text[250])
        {
            Caption = 'L30-LINE_ALLOWANCE_REASON';
            DataClassification = ToBeClassified;
        }
        field(34; "L31-LINE_TAX_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'L31-LINE_TAX_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(35; "L32-LINE_TAX_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'L32-LINE_TAX_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(36; "L33-LINE_NET_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'L33-LINE_NET_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(37; "L34-LINE_NET_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'L34-LINE_NET_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(38; "L35-LINE_NET_INCLUDE_TAX_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'L35-LINE_NET_INCLUDE_TAX_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(39; "L36-LINE_NET_INCLUDE_TAX_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'L36-LINE_NET_INCLUDE_TAX_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(40; "L37-PRODUCT_REMARK1"; Text[250])
        {
            Caption = 'L37-PRODUCT_REMARK1';
            DataClassification = ToBeClassified;
        }
        field(41; "L38-PRODUCT_REMARK2"; Text[250])
        {
            Caption = 'L38-PRODUCT_REMARK2';
            DataClassification = ToBeClassified;
        }
        field(42; "L39-PRODUCT_REMARK3"; Text[250])
        {
            Caption = 'L39-PRODUCT_REMARK3';
            DataClassification = ToBeClassified;
        }
        field(43; "L40-PRODUCT_REMARK4"; Text[250])
        {
            Caption = 'L40-PRODUCT_REMARK4';
            DataClassification = ToBeClassified;
        }
        field(44; "L41-PRODUCT_REMARK5"; Text[250])
        {
            Caption = 'L41-PRODUCT_REMARK5';
            DataClassification = ToBeClassified;
        }
        field(45; "L42-PRODUCT_REMARK6"; Text[250])
        {
            Caption = 'L42-PRODUCT_REMARK6';
            DataClassification = ToBeClassified;
        }
        field(46; "L43-PRODUCT_REMARK7"; Text[250])
        {
            Caption = 'L43-PRODUCT_REMARK7';
            DataClassification = ToBeClassified;
        }
        field(47; "L44-PRODUCT_REMARK8"; Text[250])
        {
            Caption = 'L44-PRODUCT_REMARK8';
            DataClassification = ToBeClassified;
        }
        field(48; "L45-PRODUCT_REMARK9"; Text[250])
        {
            Caption = 'L45-PRODUCT_REMARK9';
            DataClassification = ToBeClassified;
        }
        field(49; "L46-PRODUCT_REMARK10"; Text[250])
        {
            Caption = 'L46-PRODUCT_REMARK10';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(Key1; "Primary Key", idBody, idLine)
        {
            Clustered = true;
        }
    }
    var
        myInt: Integer;

    trigger OnInsert()
    begin

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