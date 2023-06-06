page 80000 "PageLine"
{
    Caption = 'Page Line';
    PageType = ListPart;
    DataCaptionFields = idLine;
    SaveValues = true;
    SourceTable = "API Line";
    AutoSplitKey = true;
    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("idLine"; Rec."idLine")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'Id Line';
                    Visible = true;
                }
                field("L01-LINE_ID"; Rec."L01-LINE_ID")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L01-LINE_ID';
                    Visible = true;
                }
                field("L02-PRODUCT_ID"; Rec."L02-PRODUCT_ID")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L02-PRODUCT_ID';
                    Visible = true;
                }
                field("L03-PRODUCT_NAME"; Rec."L03-PRODUCT_NAME")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L03-PRODUCT_NAME';
                    Visible = true;
                }
                field("L04-PRODUCT_DESC"; Rec."L04-PRODUCT_DESC")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L04-PRODUCT_DESC';
                    Visible = true;
                }
                field("L05-PRODUCT_BATCH_ID"; Rec."L05-PRODUCT_BATCH_ID")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L05-PRODUCT_BATCH_ID';
                    Visible = true;
                }
                field("L06-PRODUCT_EXPIRE_DTM"; Rec."L06-PRODUCT_EXPIRE_DTM")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L06-PRODUCT_EXPIRE_DTM';
                    Visible = true;
                }
                field("L07-PRODUCT_CLASS_CODE"; Rec."L07-PRODUCT_CLASS_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L07-PRODUCT_CLASS_CODE';
                    Visible = true;
                }
                field("L08-PRODUCT_CLASS_NAME"; Rec."L08-PRODUCT_CLASS_NAME")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L08-PRODUCT_CLASS_NAME';
                    Visible = true;
                }
                field("L09-PRODUCT_ORIGIN_COUNTRY_ID"; Rec."L09-PRODUCT_ORIGIN_COUNTRY_ID")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L09-PRODUCT_ORIGIN_COUNTRY_ID';
                    Visible = true;
                }
                field("L10-PRODUCT_CHARGE_AMOUNT"; Rec."L10-PRODUCT_CHARGE_AMOUNT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L10-PRODUCT_CHARGE_AMOUNT';
                    Visible = true;
                }
                field("L11-PRODUCT_CHARGE_CURRENCY_CODE"; Rec."L11-PRODUCT_CHARGE_CURRENCY_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L11-PRODUCT_CHARGE_CURRENCY_CODE';
                    Visible = true;
                }
                field("L12-PRODUCT_ALLOWANCE_CHARGE_IND"; Rec."L12-PRODUCT_ALLOWANCE_CHARGE_IND")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L12-PRODUCT_ALLOWANCE_CHARGE_IND';
                    Visible = true;
                }
                field("L13-PRODUCT_ALLOWANCE_ACTUAL_AMOUNT"; Rec."L13-PRODUCT_ALLOWANCE_ACTUAL_AMOUNT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L13-PRODUCT_ALLOWANCE_ACTUAL_AMOUNT';
                    Visible = true;
                }
                field("L14-PRODUCT_ALLOWANCE_ACTUAL_CURRENCY_CODE"; Rec."L14-PRODUCT_ALLOWANCE_ACTUAL_CURRENCY_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L14-PRODUCT_ALLOWANCE_ACTUAL_CURRENCY_CODE';
                    Visible = true;
                }
                field("L15-PRODUCT_ALLOWANCE_REASON_CODE"; Rec."L15-PRODUCT_ALLOWANCE_REASON_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L15-PRODUCT_ALLOWANCE_REASON_CODE';
                    Visible = true;
                }
                field("L16-PRODUCT_ALLOWANCE_REASON"; Rec."L16-PRODUCT_ALLOWANCE_REASON")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L16-PRODUCT_ALLOWANCE_REASON';
                    Visible = false;
                }
                field("L17-PRODUCT_QUANTITY"; Rec."L17-PRODUCT_QUANTITY")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L17-PRODUCT_QUANTITY';
                    Visible = false;
                }
                field("L18-PRODUCT_UNIT_CODE"; Rec."L18-PRODUCT_UNIT_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L18-PRODUCT_UNIT_CODE';
                    Visible = false;
                }
                field("L19-PRODUCT_QUANTITY_PER_UNIT"; Rec."L19-PRODUCT_QUANTITY_PER_UNIT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L19-PRODUCT_QUANTITY_PER_UNIT';
                    Visible = false;
                }
                field("L20-LINE_TAX_TYPE_CODE"; Rec."L20-LINE_TAX_TYPE_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L20-LINE_TAX_TYPE_CODE';
                    Visible = false;
                }
                field("L21-LINE_TAX_CAL_RATE"; Rec."L21-LINE_TAX_CAL_RATE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L21-LINE_TAX_CAL_RATE';
                    Visible = false;
                }
                field("L22-LINE_BASIS_AMOUNT"; Rec."L22-LINE_BASIS_AMOUNT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L22-LINE_BASIS_AMOUNT';
                    Visible = false;
                }
                field("L23-LINE_BASIS_CURRENCY_CODE"; Rec."L23-LINE_BASIS_CURRENCY_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L23-LINE_BASIS_CURRENCY_CODE';
                    Visible = false;
                }
                field("L24-LINE_TAX_CAL_AMOUNT"; Rec."L24-LINE_TAX_CAL_AMOUNT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L24-LINE_TAX_CAL_AMOUNT';
                    Visible = false;
                }
                field("L25-LINE_TAX_CAL_CURRENCY_CODE"; Rec."L25-LINE_TAX_CAL_CURRENCY_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L25-LINE_TAX_CAL_CURRENCY_CODE';
                    Visible = false;
                }
                field("L26-LINE_ALLOWANCE_CHARGE_IND"; Rec."L26-LINE_ALLOWANCE_CHARGE_IND")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L26-LINE_ALLOWANCE_CHARGE_IND';
                    Visible = false;
                }
                field("L27-LINE_ALLOWANCE_ACTUAL_AMOUNT"; Rec."L27-LINE_ALLOWANCE_ACTUAL_AMOUNT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L27-LINE_ALLOWANCE_ACTUAL_AMOUNT';
                    Visible = false;
                }
                field("L28-LINE_ALLOWANCE_ACTUAL_CURRENCY_CODE"; Rec."L28-LINE_ALLOWANCE_ACTUAL_CURRENCY_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L28-LINE_ALLOWANCE_ACTUAL_CURRENCY_CODE';
                    Visible = false;
                }
                field("L29-LINE_ALLOWANCE_REASON_CODE"; Rec."L29-LINE_ALLOWANCE_REASON_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L29-LINE_ALLOWANCE_REASON_CODE';
                    Visible = false;
                }
                field("L30-LINE_ALLOWANCE_REASON"; Rec."L30-LINE_ALLOWANCE_REASON")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L30-LINE_ALLOWANCE_REASON';
                    Visible = false;
                }
                field("L31-LINE_TAX_TOTAL_AMOUNT"; Rec."L31-LINE_TAX_TOTAL_AMOUNT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L31-LINE_TAX_TOTAL_AMOUNT';
                    Visible = false;
                }
                field("L32-LINE_TAX_TOTAL_CURRENCY_CODE"; Rec."L32-LINE_TAX_TOTAL_CURRENCY_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L32-LINE_TAX_TOTAL_CURRENCY_CODE';
                    Visible = false;
                }
                field("L33-LINE_NET_TOTAL_AMOUNT"; Rec."L33-LINE_NET_TOTAL_AMOUNT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L33-LINE_NET_TOTAL_AMOUNT';
                    Visible = false;
                }
                field("L34-LINE_NET_TOTAL_CURRENCY_CODE"; Rec."L34-LINE_NET_TOTAL_CURRENCY_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L34-LINE_NET_TOTAL_CURRENCY_CODE';
                    Visible = false;
                }
                field("L35-LINE_NET_INCLUDE_TAX_TOTAL_AMOUNT"; Rec."L35-LINE_NET_INCLUDE_TAX_TOTAL_AMOUNT")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L35-LINE_NET_INCLUDE_TAX_TOTAL_AMOUNT';
                    Visible = false;
                }
                field("L36-LINE_NET_INCLUDE_TAX_TOTAL_CURRENCY_CODE"; Rec."L36-LINE_NET_INCLUDE_TAX_TOTAL_CURRENCY_CODE")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L36-LINE_NET_INCLUDE_TAX_TOTAL_CURRENCY_CODE';
                    Visible = false;
                }
                field("L37-PRODUCT_REMARK1"; Rec."L37-PRODUCT_REMARK1")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L37-PRODUCT_REMARK1';
                    Visible = false;
                }
                field("L38-PRODUCT_REMARK2"; Rec."L38-PRODUCT_REMARK2")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L38-PRODUCT_REMARK2';
                    Visible = false;
                }
                field("L39-PRODUCT_REMARK3"; Rec."L39-PRODUCT_REMARK3")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L39-PRODUCT_REMARK3';
                    Visible = false;
                }
                field("L40-PRODUCT_REMARK4"; Rec."L40-PRODUCT_REMARK4")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L40-PRODUCT_REMARK4';
                    Visible = false;
                }
                field("L41-PRODUCT_REMARK5"; Rec."L41-PRODUCT_REMARK5")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L41-PRODUCT_REMARK5';
                    Visible = false;
                }
                field("L42-PRODUCT_REMARK6"; Rec."L42-PRODUCT_REMARK6")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L42-PRODUCT_REMARK6';
                    Visible = false;
                }
                field("L43-PRODUCT_REMARK7"; Rec."L43-PRODUCT_REMARK7")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L43-PRODUCT_REMARK7';
                    Visible = false;
                }
                field("L44-PRODUCT_REMARK8"; Rec."L44-PRODUCT_REMARK8")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L44-PRODUCT_REMARK8';
                    Visible = false;
                }
                field("L45-PRODUCT_REMARK9"; Rec."L45-PRODUCT_REMARK9")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L45-PRODUCT_REMARK9';
                    Visible = false;
                }
                field("L46-PRODUCT_REMARK10"; Rec."L46-PRODUCT_REMARK10")
                {
                    ApplicationArea = Basic, Suite, Jobs;
                    Style = Strong;
                    ToolTip = 'L46-PRODUCT_REMARK10';
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Line)
            {
                action(action)
                {
                    ApplicationArea = All;


                    /*trigger OnAction()
                    var
                        salesetup: Record "Sales & Receivables Setup";
                        headerAPIKey: text;
                    begin
                        salesetup.get();
                        headerAPIKey :=  salesetup.APIkey;

                    end;*/
                }

            }
        }
    }

    var
        myInt: Integer;
}