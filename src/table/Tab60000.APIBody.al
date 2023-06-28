table 60000 "API Body"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; idBody; Integer)
        {
            Caption = 'idBody';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = ToBeClassified;
            TableRelation = "API Setup"."Primary Key";
        }
        field(3; "C01-SELLER_TAX_ID"; Text[13])
        {
            //เลขประจำตัวผู้เสียภาษีอากรของผู้ขาย
            Caption = 'C01-SELLER_TAX_ID';
            DataClassification = ToBeClassified;
        }
        field(4; "C02-SELLER_BRANCH_ID"; Text[5])
        {
            //เลขสาขาสถานประกอบการ
            Caption = 'C02-SELLER_BRANCH_ID';
            DataClassification = ToBeClassified;
        }
        field(5; "C03-FILE_NAME"; Text[50])
        {
            //ชื่อไฟล์
            Caption = 'C03-FILE_NAME';
            DataClassification = ToBeClassified;
        }
        field(6; "H01-DOCUMENT_TYPE_CODE"; Text[3])
        {
            //ประเภทเอกสาร
            Caption = 'H01-DOCUMENT_TYPE_CODE';
            DataClassification = ToBeClassified;
        }
        field(7; "H02-DOCUMENT_NAME"; Text[35])
        {
            //ชื่อเอกสาร
            Caption = 'H02-DOCUMENT_NAME';
            DataClassification = ToBeClassified;
        }
        field(8; "H03-DOCUMENT_ID"; Text[35])
        {
            //เลขที่เอกสาร
            Caption = 'H03-DOCUMENT_ID';
            DataClassification = ToBeClassified;
        }
        field(9; "H04-DOCUMENT_ISSUE_DTM"; Text[250])
        {
            //**Type DateTime size 19 ** เอกสารลงวันที่
            Caption = 'H04-DOCUMENT_ISSUE_DTM';
            DataClassification = ToBeClassified;
        }
        field(10; "H05-CREATE_PURPOSE_CODE"; Code[6])
        {
            Caption = 'H05-CREATE_PURPOSE_CODE';
            DataClassification = ToBeClassified;
        }
        field(11; "H06-CREATE_PURPOSE"; Text[256])
        {
            //สาเหตุการออกเอกสาร
            Caption = 'H06-CREATE_PURPOSE';
            DataClassification = ToBeClassified;
        }
        field(12; "H07-ADDITIONAL_REF_ASSIGN_ID"; Text[35])
        {
            //เลขที่อ้างอิง
            Caption = 'H07-ADDITIONAL_REF_ASSIGN_ID';
            DataClassification = ToBeClassified;
        }
        field(13; "H08-ADDITIONAL_REF_ISSUE_DTM"; Text[250])
        {
            //**Type DateTime size 19 ** เอกสารอ้างอิงลงวันที่ 
            Caption = 'H08-ADDITIONAL_REF_ISSUE_DTM';
            DataClassification = ToBeClassified;
        }
        field(14; "H09-ADDITIONAL_REF_TYPE_CODE"; Text[3])
        {
            //ประเภทเอกสารอ้างอิง
            Caption = 'H09-ADDITIONAL_REF_TYPE_CODE';
            DataClassification = ToBeClassified;
        }
        field(15; "H10-ADDITIONAL_REF_DOCUMENT_NAME"; Text[35])
        {
            //ชื่อเอกสารอ้างอิง
            Caption = 'H10-ADDITIONAL_REF_DOCUMENT_NAME';
            DataClassification = ToBeClassified;
        }
        field(16; "H11-DELIVERY_TYPE_CODE"; Text[3])
        {
            //เงื่อนไขการส่งของ
            Caption = 'H11-DELIVERY_TYPE_CODE';
            DataClassification = ToBeClassified;
        }
        field(17; "H12-BUYER_ORDER_ASSIGN_ID"; Text[35])
        {
            //เลขที่ใบสั่งซื้อ
            Caption = 'H12-BUYER_ORDER_ASSIGN_ID';
            DataClassification = ToBeClassified;
        }
        field(18; "H13-BUYER_ORDER_ISSUE_DTM"; Text[250])
        {
            //**Type DateTime size 19 ** วันเดือนปี ที่ออกใบสั่งซื้อ
            Caption = 'H13-BUYER_ORDER_ISSUE_DTM';
            DataClassification = ToBeClassified;
        }
        field(19; "H14-BUYER_ORDER_REF_TYPE_CODE"; Text[3])
        {
            //ประเภทเอกสารอ้างอิงการสั่งซื้อ
            Caption = 'H14-BUYER_ORDER_REF_TYPE_CODE';
            DataClassification = ToBeClassified;
        }
        field(20; "H15-DOCUMENT_REMARK"; Text[500])
        {
            //หมายเหตุท้ายเอกสาร
            Caption = 'H15-DOCUMENT_REMARK';
            DataClassification = ToBeClassified;
        }
        field(21; "H16-VOUCHER_NO"; Text[50])
        {
            //เลขใบสำคัญจ่าย
            Caption = 'H16-VOUCHER_NO';
            DataClassification = ToBeClassified;
        }
        field(22; "H17-SELLER_CONTACT_PERSON_NAME"; Text[140])
        {
            //ชื่อผู้ติดต่อ
            Caption = 'H17-SELLER_CONTACT_PERSON_NAME';
            DataClassification = ToBeClassified;
        }
        field(23; "H18-SELLER_CONTACT_DEPARTMENT_NAME"; Text[140])
        {
            //ชื่อแผนก
            Caption = 'H18-SELLER_CONTACT_DEPARTMENT_NAME';
            DataClassification = ToBeClassified;
        }
        field(24; "H19-SELLER_CONTACT_URIID"; Text[256])
        {
            //Email
            Caption = 'H19-SELLER_CONTACT_URIID';
            DataClassification = ToBeClassified;
        }
        field(25; "H20-SELLER_CONTACT_PHONE_NO"; Text[35])
        {
            //เบอร์โทรศัพท์
            Caption = 'H20-SELLER_CONTACT_PHONE_NO';
            DataClassification = ToBeClassified;
        }
        field(26; "H21-FLEX_FIELD"; Text[2048])
        {
            //Flex Field **size 4000 Type Text**
            Caption = 'H21-FLEX_FIELD';
            DataClassification = ToBeClassified;
        }
        field(27; "H22-SELLER_BRANCH_ID"; Text[5])
        {
            //เลขสาขาสถานประกอบการ
            Caption = 'H22-SELLER_BRANCH_ID';
            DataClassification = ToBeClassified;
        }
        field(28; "H23-SOURCE_SYSTEM"; Text[100])
        {
            //ระบบที่ออกเอกสาร
            Caption = 'H23-SOURCE_SYSTEM';
            DataClassification = ToBeClassified;
        }
        field(29; "H24-ENCRYPT_PASSWORD"; Text[50])
        {
            //รหัสสำหรับ Encrypt ไฟล์ pdf
            Caption = 'H24-ENCRYPT_PASSWORD';
            DataClassification = ToBeClassified;
        }
        field(30; "H25-PDF_TEMPLATE_ID"; Text[16])
        {
            //รหัส Template สร้างไฟล์ pdf
            Caption = 'H25-PDF_TEMPLATE_ID';
            DataClassification = ToBeClassified;
        }
        field(31; "H26-SEND_MAIL_IND"; Text[250])
        {
            Caption = 'H26-SEND_MAIL_IND';
            DataClassification = ToBeClassified;
        }
        field(32; "H27-PDF_NAME"; Text[250])
        {
            Caption = 'H27-PDF_NAME';
            DataClassification = ToBeClassified;
        }

        //A zone

        field(33; "B01-BUYER_ID"; Text[35])
        {
            //รหัสผู้ซื้อ
            Caption = 'B01-BUYER_ID';
            DataClassification = ToBeClassified;
        }
        field(34; "B02-BUYER_NAME"; Text[256])
        {
            //ชื่อผู้ซื้อ
            Caption = 'B02-BUYER_NAME';
            DataClassification = ToBeClassified;
        }
        field(35; "B03-BUYER_TAX_ID_TYPE"; Text[4])
        {
            //ประเภทผู้เสียภาษีอากร
            Caption = 'B03-BUYER_TAX_ID_TYPE';
            DataClassification = ToBeClassified;
        }
        field(36; "B04-BUYER_TAX_ID"; Text[35])
        {
            //เลขประจำตัวผู้เสียภาษีอากร
            Caption = 'B04-BUYER_TAX_ID';
            DataClassification = ToBeClassified;
        }
        field(37; "B05-BUYER_BRANCH_ID"; Text[5])
        {
            //เลขที่สาขา
            Caption = 'B05-BUYER_BRANCH_ID';
            DataClassification = ToBeClassified;
        }
        field(38; "B06-BUYER_CONTACT_PERSON_NAME"; Text[140])
        {
            //ชื่อผู้ติดต่อ
            Caption = 'B06-BUYER_CONTACT_PERSON_NAME';
            DataClassification = ToBeClassified;
        }
        field(39; "B07-BUYER_CONTACT_DEPARTMENT_NAME"; Text[140])
        {
            //ชื่อแผนก
            Caption = 'B07-BUYER_CONTACT_DEPARTMENT_NAME';
            DataClassification = ToBeClassified;
        }
        field(40; "B08-BUYER_URIID"; Text[256])
        {
            //Email
            Caption = 'B08-BUYER_URIID';
            DataClassification = ToBeClassified;
        }
        field(41; "B09-BUYER_CONTACT_PHONE_NO"; Text[35])
        {
            //เบอร์โทรศัพท์
            Caption = 'B09-BUYER_CONTACT_PHONE_NO';
            DataClassification = ToBeClassified;
        }
        field(42; "B10-BUYER_POST_CODE"; Text[16])
        {
            //รหัสไปรษณีย์
            Caption = 'B10-BUYER_POST_CODE';
            DataClassification = ToBeClassified;
        }
        field(43; "B11-BUYER_BUILDING_NAME"; Text[70])
        {
            //ชื่ออาคาร
            Caption = 'B11-BUYER_BUILDING_NAME';
            DataClassification = ToBeClassified;
        }
        field(44; "B12-BUYER_BUILDING_NO"; Text[70])
        {
            //บ้านเลขที่
            Caption = 'B12-BUYER_BUILDING_NO';
            DataClassification = ToBeClassified;
        }
        field(45; "B13-BUYER_ADDRESS_LINE1"; Text[256])
        {
            Caption = 'B13-BUYER_ADDRESS_LINE1';
            DataClassification = ToBeClassified;
        }
        field(46; "B14-BUYER_ADDRESS_LINE2"; Text[256])
        {
            Caption = 'B14-BUYER_ADDRESS_LINE2';
            DataClassification = ToBeClassified;
        }
        field(47; "B15-BUYER_ADDRESS_LINE3"; Text[70])
        {
            //ซอย
            Caption = 'B15-BUYER_ADDRESS_LINE3';
            DataClassification = ToBeClassified;
        }
        field(48; "B16-BUYER_ADDRESS_LINE4"; Text[70])
        {
            //หมู่บ้าน
            Caption = 'B16-BUYER_ADDRESS_LINE4';
            DataClassification = ToBeClassified;
        }
        field(49; "B17-BUYER_ADDRESS_LINE5"; Text[70])
        {
            //หมู่ที่
            Caption = 'B17-BUYER_ADDRESS_LINE5';
            DataClassification = ToBeClassified;
        }
        field(50; "B18-BUYER_STREET_NAME"; Text[70])
        {
            //ถนน
            Caption = 'B18-BUYER_STREET_NAME';
            DataClassification = ToBeClassified;
        }
        field(51; "B19-BUYER_CITY_SUB_DIV_ID"; Text[70])
        {
            //รหัสตำบล
            Caption = 'B19-BUYER_CITY_SUB_DIV_ID';
            DataClassification = ToBeClassified;
        }
        field(52; "B20-BUYER_CITY_SUB_DIV_NAME"; Text[70])
        {
            //ชื่อตำบล
            Caption = 'B20-BUYER_CITY_SUB_DIV_NAME';
            DataClassification = ToBeClassified;
        }
        field(53; "B21-BUYER_CITY_ID"; Text[70])
        {
            //รหัสอำเภอ
            Caption = 'B21-BUYER_CITY_ID';
            DataClassification = ToBeClassified;
        }
        field(54; "B22-BUYER_CITY_NAME"; Text[70])
        {
            //ชื่ออำเภอ
            Caption = 'B22-BUYER_CITY_NAME';
            DataClassification = ToBeClassified;
        }
        field(55; "B23-BUYER_COUNTRY_SUB_DIV_ID"; Text[70])
        {
            //รหัสจังหวัด
            Caption = 'B23-BUYER_COUNTRY_SUB_DIV_ID';
            DataClassification = ToBeClassified;
        }
        field(56; "B24-BUYER_COUNTRY_SUB_DIV_NAME"; Text[70])
        {
            //ชื่อจังหวัด
            Caption = 'B24-BUYER_COUNTRY_SUB_DIV_NAME';
            DataClassification = ToBeClassified;
        }
        field(57; "B25-BUYER_COUNTRY_ID"; Text[3])
        {
            //รหัสประเทศ
            Caption = 'B25-BUYER_COUNTRY_ID';
            DataClassification = ToBeClassified;
        }
        field(58; "O01-SHIP_TO_ID"; Text[35])
        {
            //รหัสผู้รับ
            Caption = 'O01-SHIP_TO_ID';
            DataClassification = ToBeClassified;
        }
        field(59; "O02-SHIP_TO_NAME"; Text[256])
        {
            //ชื่อผู้รับ
            Caption = 'O02-SHIP_TO_NAME';
            DataClassification = ToBeClassified;
        }
        field(60; "O03-SHIP_TO_TAX_ID_TYPE"; Text[4])
        {
            //ประเภทผู้เสียภาษีอาการ
            Caption = 'O03-SHIP_TO_TAX_ID_TYPE';
            DataClassification = ToBeClassified;
        }
        field(61; "O04-SHIP_TO_TAX_ID"; Text[35])
        {
            //เลขประจำตัวผู้เสียภาษีอาการ
            Caption = 'O04-SHIP_TO_TAX_ID';
            DataClassification = ToBeClassified;
        }
        field(62; "O05-SHIP_TO_BRANCH_ID"; Text[5])
        {
            //เลขที่สาขา
            Caption = 'O05-SHIP_TO_BRANCH_ID';
            DataClassification = ToBeClassified;
        }
        field(63; "O06-SHIP_TO_CONTACT_PERSON_NAME"; Text[140])
        {
            //ชื่อผู้ติดต่อ
            Caption = 'O06-SHIP_TO_CONTACT_PERSON_NAME';
            DataClassification = ToBeClassified;
        }
        field(64; "O07-SHIP_TO_CONTACT_DEPARTMENT_NAME"; Text[140])
        {
            //ชื่อแผนก
            Caption = 'O07-SHIP_TO_CONTACT_DEPARTMENT_NAME';
            DataClassification = ToBeClassified;
        }
        field(65; "O08-SHIP_TO_URIID"; Text[256])
        {
            //Email
            Caption = 'O08-SHIP_TO_URIID';
            DataClassification = ToBeClassified;
        }
        field(66; "O09-SHIP_TO_PHONE_NO"; Text[35])
        {
            //เบอร์โทรศัพท์
            Caption = 'O09-SHIP_TO_PHONE_NO';
            DataClassification = ToBeClassified;
        }
        field(67; "O10-SHIP_TO_POST_CODE"; Text[16])
        {
            //รหัสไปรษณีย์
            Caption = 'O10-SHIP_TO_POST_CODE';
            DataClassification = ToBeClassified;
        }
        field(68; "O11-SHIP_TO_BUILDING_NAME"; Text[70])
        {
            //ชื่ออาคาร
            Caption = 'O11-SHIP_TO_BUILDING_NAME';
            DataClassification = ToBeClassified;
        }
        field(69; "O12-SHIP_TO_BUILDING_NO"; Text[70])
        {
            //บ้านเลขที่
            Caption = 'O12-SHIP_TO_BUILDING_NO';
            DataClassification = ToBeClassified;
        }
        field(70; "O13-SHIP_TO_ADDRESS_LINE1"; Text[256])
        {
            Caption = 'O13-SHIP_TO_ADDRESS_LINE1';
            DataClassification = ToBeClassified;
        }
        field(71; "O14-SHIP_TO_ADDRESS_LINE2"; Text[256])
        {
            Caption = 'O14-SHIP_TO_ADDRESS_LINE2';
            DataClassification = ToBeClassified;
        }
        field(72; "O15-SHIP_TO_ADDRESS_LINE3"; Text[70])
        {
            //ซอย
            Caption = 'O15-SHIP_TO_ADDRESS_LINE3';
            DataClassification = ToBeClassified;
        }
        field(73; "O16-SHIP_TO_ADDRESS_LINE4"; Text[70])
        {
            //หมู่บ้าน
            Caption = 'O16-SHIP_TO_ADDRESS_LINE4';
            DataClassification = ToBeClassified;
        }
        field(74; "O17-SHIP_TO_ADDRESS_LINE5"; Text[70])
        {
            //หมู่ที่
            Caption = 'O17-SHIP_TO_ADDRESS_LINE5';
            DataClassification = ToBeClassified;
        }
        field(75; "O18-SHIP_TO_STREET_NAME"; Text[70])
        {
            //ถนน
            Caption = 'O18-SHIP_TO_STREET_NAME';
            DataClassification = ToBeClassified;
        }
        field(76; "O19-SHIP_TO_CITY_SUB_DIV_ID"; Text[70])
        {
            //รหัสตำบล
            Caption = 'O19-SHIP_TO_CITY_SUB_DIV_ID';
            DataClassification = ToBeClassified;
        }
        field(77; "O20-SHIP_TO_CITY_SUB_DIV_NAME"; Text[70])
        {
            //ชื่อตำบล
            Caption = 'O20-SHIP_TO_CITY_SUB_DIV_NAME';
            DataClassification = ToBeClassified;
        }
        field(78; "O21-SHIP_TO_CITY_ID"; Text[70])
        {
            //รหัสอำเภอ
            Caption = 'O21-SHIP_TO_CITY_ID';
            DataClassification = ToBeClassified;
        }
        field(79; "O22-SHIP_TO_CITY_NAME"; Text[70])
        {
            //ชื่ออำเภอ
            Caption = 'O22-SHIP_TO_CITY_NAME';
            DataClassification = ToBeClassified;
        }
        field(80; "O23-SHIP_TO_COUNTRY_SUB_DIV_ID"; Text[70])
        {
            //รหัสจังหวัด
            Caption = 'O23-SHIP_TO_COUNTRY_SUB_DIV_ID';
            DataClassification = ToBeClassified;
        }
        field(81; "O24-SHIP_TO_COUNTRY_SUB_DIV_NAME"; Text[70])
        {
            //ชื่อจังหวัด
            Caption = 'O24-SHIP_TO_COUNTRY_SUB_DIV_NAME';
            DataClassification = ToBeClassified;
        }
        field(82; "O25-SHIP_TO_COUNTRY_ID"; Text[3])
        {
            //รหัสประเทศ
            Caption = 'O25-SHIP_TO_COUNTRY_ID';
            DataClassification = ToBeClassified;
        }
        /*field(83; "LINE_ITEM_INFORMATION"; Text[250])
        {
            Caption = 'LINE_ITEM_INFORMATION';
            DataClassification = ToBeClassified;
        }*/

        //M zone

        //R zone

        //E zone

        //P zone

        //Y zone

        field(84; "F01-LINE_TOTAL_COUNT"; Text[5])
        {
            //**Type Number** จำนวนรายการสินค้า
            Caption = 'F01-LINE_TOTAL_COUNT';
            DataClassification = ToBeClassified;
        }
        field(85; "F02-DELIVERY_OCCUR_DTM"; Text[19])
        {
            //**Type DateTime size 19 ** วันเวลานัดส่งสินค้า
            Caption = 'F02-DELIVERY_OCCUR_DTM';
            DataClassification = ToBeClassified;
        }
        field(86; "F03-INVOICE_CURRENCY_CODE"; Code[3])
        {
            //รหัสสกุลเงินตรา
            Caption = 'F03-INVOICE_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(87; "F04-TAX_TYPE_CODE1"; Text[3])
        {
            //รหัสประเภทภาษี
            Caption = 'F04-TAX_TYPE_CODE1';
            DataClassification = ToBeClassified;
        }
        field(88; "F05-TAX_CAL_RATE1"; Text[5])
        {
            //อัตราภาษี
            Caption = 'F05-TAX_CAL_RATE1';
            DataClassification = ToBeClassified;
        }
        field(89; "F06-BASIS_AMOUNT1"; Text[16])
        {
            //มูลค่าสินค้า/บริการ(ไม่รวมภาษีมูลค่าเพิ่ม)
            Caption = 'F06-BASIS_AMOUNT1';
            DataClassification = ToBeClassified;
        }
        field(90; "F07-BASIS_CURRENCY_CODE1"; Code[3])
        {
            //มูลค่าสินค้า/บริการ(ไม่รวมภาษีมูลค่าเพิ่ม)
            Caption = 'F07-BASIS_CURRENCY_CODE1';
            DataClassification = ToBeClassified;
        }
        field(91; "F08-TAX_CAL_AMOUNT1"; Text[16])
        {
            //มูลค่าภาษีมูลค่าเพิ่ม
            Caption = 'F08-TAX_CAL_AMOUNT1';
            DataClassification = ToBeClassified;
        }
        field(92; "F09-TAX_CAL_CURRENCY_CODE1"; Code[3])
        {
            //มูลค่าภาษีมูลค่าเพิ่ม
            Caption = 'F09-TAX_CAL_CURRENCY_CODE1';
            DataClassification = ToBeClassified;
        }
        field(93; "F10-TAX_TYPE_CODE2"; Text[3])
        {
            //รหัสประเภมภาษี
            Caption = 'F10-TAX_TYPE_CODE2';
            DataClassification = ToBeClassified;
        }
        field(94; "F11-TAX_CAL_RATE2"; Text[5])
        {
            Caption = 'F11-TAX_CAL_RATE2';
            DataClassification = ToBeClassified;
        }
        field(95; "F12-BASIS_AMOUNT2"; Text[16])
        {
            Caption = 'F12-BASIS_AMOUNT2';
            DataClassification = ToBeClassified;
        }
        field(96; "F13-BASIS_CURRENCY_CODE2"; Code[3])
        {
            Caption = 'F13-BASIS_CURRENCY_CODE2';
            DataClassification = ToBeClassified;
        }
        field(97; "F14-TAX_CAL_AMOUNT2"; Text[16])
        {
            Caption = 'F14-TAX_CAL_AMOUNT2';
            DataClassification = ToBeClassified;
        }
        field(98; "F15-TAX_CAL_CURRENCY_CODE2"; Code[3])
        {
            Caption = 'F15-TAX_CAL_CURRENCY_CODE2';
            DataClassification = ToBeClassified;
        }
        field(99; "F16-TAX_TYPE_CODE3"; Text[3])
        {
            Caption = 'F16-TAX_TYPE_CODE3';
            DataClassification = ToBeClassified;
        }
        field(100; "F17-TAX_CAL_RATE3"; Text[5])
        {
            Caption = 'F17-TAX_CAL_RATE3';
            DataClassification = ToBeClassified;
        }
        field(101; "F18-BASIS_AMOUNT3"; Text[16])
        {
            Caption = 'F18-BASIS_AMOUNT3';
            DataClassification = ToBeClassified;
        }
        field(102; "F19-BASIS_CURRENCY_CODE3"; Code[3])
        {
            Caption = 'F19-BASIS_CURRENCY_CODE3';
            DataClassification = ToBeClassified;
        }
        field(103; "F20-TAX_CAL_AMOUNT3"; Text[16])
        {
            Caption = 'F20-TAX_CAL_AMOUNT3';
            DataClassification = ToBeClassified;
        }
        field(104; "F21-TAX_CAL_CURRENCY_CODE3"; Code[3])
        {
            Caption = 'F21-TAX_CAL_CURRENCY_CODE3';
            DataClassification = ToBeClassified;
        }
        field(105; "F22-TAX_TYPE_CODE4"; Text[3])
        {
            Caption = 'F22-TAX_TYPE_CODE4';
            DataClassification = ToBeClassified;
        }
        field(106; "F23-TAX_CAL_RATE4"; Text[5])
        {
            Caption = 'F23-TAX_CAL_RATE4';
            DataClassification = ToBeClassified;
        }
        field(107; "F24-BASIS_AMOUNT4"; Text[16])
        {
            Caption = 'F24-BASIS_AMOUNT4';
            DataClassification = ToBeClassified;
        }
        field(108; "F25-BASIS_CURRENCY_CODE4"; Code[3])
        {
            Caption = 'F25-BASIS_CURRENCY_CODE4';
            DataClassification = ToBeClassified;
        }
        field(109; "F26-TAX_CAL_AMOUNT4"; Text[16])
        {
            Caption = 'F26-TAX_CAL_AMOUNT4';
            DataClassification = ToBeClassified;
        }
        field(110; "F27-TAX_CAL_CURRENCY_CODE4"; Code[3])
        {
            Caption = 'F27-TAX_CAL_CURRENCY_CODE4';
            DataClassification = ToBeClassified;
        }
        field(111; "F28-ALLOWANCE_CHARGE_IND"; Text[5])
        {
            Caption = 'F28-ALLOWANCE_CHARGE_IND';
            DataClassification = ToBeClassified;
        }
        field(112; "F29-ALLOWANCE_ACTUAL_AMOUNT"; Text[16])
        {
            Caption = 'F29-ALLOWANCE_ACTUAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(113; "F30-ALLOWANCE_ACTUAL_CURRENCY_CODE"; Code[3])
        {
            //
            Caption = 'F30-ALLOWANCE_ACTUAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(114; "F31-ALLOWANCE_REASON_CODE"; Text[250])
        {
            Caption = 'F31-ALLOWANCE_REASON_CODE';
            DataClassification = ToBeClassified;
        }
        field(115; "F32-ALLOWANCE_REASON"; Text[250])
        {
            Caption = 'F32-ALLOWANCE_REASON';
            DataClassification = ToBeClassified;
        }
        field(116; "F33-PAYMENT_TYPE_CODE"; Text[250])
        {
            Caption = 'F33-PAYMENT_TYPE_CODE';
            DataClassification = ToBeClassified;
        }
        field(117; "F34-PAYMENT_DESCRIPTION"; Text[250])
        {
            Caption = 'F34-PAYMENT_DESCRIPTION';
            DataClassification = ToBeClassified;
        }
        field(118; "F35-PAYMENT_DUE_DTM"; Text[250])
        {
            Caption = 'F35-PAYMENT_DUE_DTM';
            DataClassification = ToBeClassified;
        }
        field(119; "F36-ORIGINAL_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F36-ORIGINAL_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(120; "F37-ORIGINAL_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'F37-ORIGINAL_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(121; "F38-LINE_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F38-LINE_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(122; "F39-LINE_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'F39-LINE_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(123; "F40-ADJUSTED_INFORMATION_AMOUNT"; Text[250])
        {
            Caption = 'F40-ADJUSTED_INFORMATION_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(124; "F41-ADJUSTED_INFORMATION_CURRENCY_CODE"; Text[250])
        {
            Caption = 'F41-ADJUSTED_INFORMATION_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(125; "F42-ALLOWANCE_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F42-ALLOWANCE_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(126; "F43-ALLOWANCE_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'F43-ALLOWANCE_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(127; "F44-CHARGE_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F44-CHARGE_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(128; "F45-CHARGE_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'F45-CHARGE_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(129; "F46-TAX_BASIS_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F46-TAX_BASIS_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(130; "F47-TAX_BASIS_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'F47-TAX_BASIS_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(131; "F48-TAX_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F48-TAX_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(132; "F49-TAX_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'F49-TAX_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(133; "F50-GRAND_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F50-GRAND_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(134; "F51-GRAND_TOTAL_CURRENCY_CODE"; Text[250])
        {
            Caption = 'F51-GRAND_TOTAL_CURRENCY_CODE';
            DataClassification = ToBeClassified;
        }
        field(135; "F52-TERM_PAYMENT"; Text[250])
        {
            Caption = 'F52-TERM_PAYMENT';
            DataClassification = ToBeClassified;
        }
        field(136; "F53-WITHHOLDINGTAX_TYPE1"; Text[250])
        {
            Caption = 'F53-WITHHOLDINGTAX_TYPE1';
            DataClassification = ToBeClassified;
        }
        field(137; "F54-WITHHOLDINGTAX_DESCRIPTION1"; Text[250])
        {
            Caption = 'F54-WITHHOLDINGTAX_DESCRIPTION1';
            DataClassification = ToBeClassified;
        }
        field(138; "F55-WITHHOLDINGTAX_RATE1"; Text[250])
        {
            Caption = 'F55-WITHHOLDINGTAX_RATE1';
            DataClassification = ToBeClassified;
        }
        field(139; "F56-WITHHOLDINGTAX_BASIS_AMOUNT1"; Text[250])
        {
            Caption = 'F56-WITHHOLDINGTAX_BASIS_AMOUNT1';
            DataClassification = ToBeClassified;
        }
        field(140; "F57-WITHHOLDINGTAX_TAX_AMOUNT1"; Text[250])
        {
            Caption = 'F57-WITHHOLDINGTAX_TAX_AMOUNT1';
            DataClassification = ToBeClassified;
        }
        field(141; "F58-WITHHOLDINGTAX_TYPE2"; Text[250])
        {
            Caption = 'F58-WITHHOLDINGTAX_TYPE2';
            DataClassification = ToBeClassified;
        }
        field(142; "F59-WITHHOLDINGTAX_DESCRIPTION2"; Text[250])
        {
            Caption = 'F59-WITHHOLDINGTAX_DESCRIPTION2';
            DataClassification = ToBeClassified;
        }
        field(143; "F60-WITHHOLDINGTAX_RATE2"; Text[250])
        {
            Caption = 'F60-WITHHOLDINGTAX_RATE2';
            DataClassification = ToBeClassified;
        }
        field(144; "F61-WITHHOLDINGTAX_BASIS_AMOUNT2"; Text[250])
        {
            Caption = 'F61-WITHHOLDINGTAX_BASIS_AMOUNT2';
            DataClassification = ToBeClassified;
        }
        field(145; "F62-WITHHOLDINGTAX_TAX_AMOUNT2"; Text[250])
        {
            Caption = 'F62-WITHHOLDINGTAX_TAX_AMOUNT2';
            DataClassification = ToBeClassified;
        }
        field(146; "F63-WITHHOLDINGTAX_TYPE3"; Text[250])
        {
            Caption = 'F63-WITHHOLDINGTAX_TYPE3';
            DataClassification = ToBeClassified;
        }
        field(147; "F64-WITHHOLDINGTAX_DESCRIPTION3"; Text[250])
        {
            Caption = 'F64-WITHHOLDINGTAX_DESCRIPTION3';
            DataClassification = ToBeClassified;
        }
        field(148; "F65-WITHHOLDINGTAX_RATE3"; Text[250])
        {
            Caption = 'F65-WITHHOLDINGTAX_RATE3';
            DataClassification = ToBeClassified;
        }
        field(149; "F66-WITHHOLDINGTAX_BASIS_AMOUNT3"; Text[250])
        {
            Caption = 'F66-WITHHOLDINGTAX_BASIS_AMOUNT3';
            DataClassification = ToBeClassified;
        }
        field(150; "F67-WITHHOLDINGTAX_TAX_AMOUNT3"; Text[250])
        {
            Caption = 'F67-WITHHOLDINGTAX_TAX_AMOUNT3';
            DataClassification = ToBeClassified;
        }
        field(151; "F68-WITHHOLDINGTAX_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F68-WITHHOLDINGTAX_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(152; "F69-ACTUAL_PAYMENT_TOTAL_AMOUNT"; Text[250])
        {
            Caption = 'F69-ACTUAL_PAYMENT_TOTAL_AMOUNT';
            DataClassification = ToBeClassified;
        }
        field(153; "F70-DOCUMENT_REMARK1"; Text[250])
        {
            Caption = 'F70-DOCUMENT_REMARK1';
            DataClassification = ToBeClassified;
        }
        field(154; "F71-DOCUMENT_REMARK2"; Text[250])
        {
            Caption = 'F71-DOCUMENT_REMARK2';
            DataClassification = ToBeClassified;
        }
        field(155; "F72-DOCUMENT_REMARK3"; Text[250])
        {
            Caption = 'F72-DOCUMENT_REMARK3';
            DataClassification = ToBeClassified;
        }
        field(156; "F73-DOCUMENT_REMARK4"; Text[250])
        {
            Caption = 'F73-DOCUMENT_REMARK4';
            DataClassification = ToBeClassified;
        }
        field(157; "F74-DOCUMENT_REMARK5"; Text[250])
        {
            Caption = 'F74-DOCUMENT_REMARK5';
            DataClassification = ToBeClassified;
        }
        field(158; "F75-DOCUMENT_REMARK6"; Text[250])
        {
            Caption = 'F75-DOCUMENT_REMARK6';
            DataClassification = ToBeClassified;
        }
        field(159; "F76-DOCUMENT_REMARK7"; Text[250])
        {
            Caption = 'F76-DOCUMENT_REMARK7';
            DataClassification = ToBeClassified;
        }
        field(160; "F77-DOCUMENT_REMARK8"; Text[250])
        {
            Caption = 'F77-DOCUMENT_REMARK8';
            DataClassification = ToBeClassified;
        }
        field(161; "F78-DOCUMENT_REMARK9"; Text[250])
        {
            Caption = 'F78-DOCUMENT_REMARK9';
            DataClassification = ToBeClassified;
        }
        field(162; "F79-DOCUMENT_REMARK10"; Text[250])
        {
            Caption = 'F79-DOCUMENT_REMARK10';
            DataClassification = ToBeClassified;
        }
        field(163; "T01-TOTAL_DOCUMENT_COUNT"; Text[250])
        {
            Caption = 'T01-TOTAL_DOCUMENT_COUNT';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; idBody/*, idHeader*/)
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