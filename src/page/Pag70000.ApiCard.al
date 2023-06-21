page 70000 "API Card"
{
    Caption = 'API Card';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "API Body";
    //MultipleNewLines = true;
    //AboutTitle = 'About API details';
    //AboutText = 'With API Postman';

    layout
    {
        area(Content)
        {
            group(C)
            {
                //Caption = 'API';
                field("C01-SELLER_TAX_ID"; Rec."C01-SELLER_TAX_ID")
                {
                    Caption = 'Seller Tax ID';
                    ApplicationArea = All;
                }
                field("C02-SELLER_BRANCH_ID"; Rec."C02-SELLER_BRANCH_ID")
                {
                    Caption = 'Seller Branch ID';
                    ApplicationArea = All;
                }
                field("C03-FILE_NAME"; Rec."C03-FILE_NAME")
                {
                    Caption = 'File Name';
                    ApplicationArea = All;
                }
            }
            group(H)
            {
                //Caption = 'API';
                field("H01-DOCUMENT_TYPE_CODE"; Rec."H01-DOCUMENT_TYPE_CODE")
                {
                    Caption = 'Document Type Code';
                    ApplicationArea = All;
                }
                field("H02-DOCUMENT_NAME"; Rec."H02-DOCUMENT_NAME")
                {
                    Caption = 'Document Name';
                    ApplicationArea = All;
                }
                field("H03-DOCUMENT_ID"; Rec."H03-DOCUMENT_ID")
                {
                    Caption = 'DOCUMENT ID';
                    ApplicationArea = All;
                }
                field("H04-DOCUMENT_ISSUE_DTM"; Rec."H04-DOCUMENT_ISSUE_DTM")
                {
                    Caption = 'DOCUMENT ISSUE';
                    ApplicationArea = All;
                }
                field("H05-CREATE_PURPOSE_CODE"; Rec."H05-CREATE_PURPOSE_CODE")
                {
                    Caption = 'CREATE PURPOSE CODE';
                    ApplicationArea = All;
                }
                field("H06-CREATE_PURPOSE"; Rec."H06-CREATE_PURPOSE")
                {
                    Caption = 'CREATE PURPOSE';
                    ApplicationArea = All;
                }
                field("H07-ADDITIONAL_REF_ASSIGN_ID"; Rec."H07-ADDITIONAL_REF_ASSIGN_ID")
                {
                    Caption = 'ADDITIONAL ASSIGN ID';
                    ApplicationArea = All;
                }
                field("H08-ADDITIONAL_REF_ISSUE_DTM"; Rec."H08-ADDITIONAL_REF_ISSUE_DTM")
                {
                    Caption = 'ADDITIONAL ISSUE DTM';
                    ApplicationArea = All;
                }
                field("H09-ADDITIONAL_REF_TYPE_CODE"; Rec."H09-ADDITIONAL_REF_TYPE_CODE")
                {
                    Caption = 'ADDITIONAL TYPE CODE';
                    ApplicationArea = All;
                }
                field("H10-ADDITIONAL_REF_DOCUMENT_NAME"; Rec."H10-ADDITIONAL_REF_DOCUMENT_NAME")
                {
                    Caption = 'ADDITIONAL DOCUMENT NAME';
                    ApplicationArea = All;
                }
                field("H11-DELIVERY_TYPE_CODE"; Rec."H11-DELIVERY_TYPE_CODE")
                {
                    Caption = 'DELIVERY TYPE CODE';
                    ApplicationArea = All;
                }
                field("H12-BUYER_ORDER_ASSIGN_ID"; Rec."H12-BUYER_ORDER_ASSIGN_ID")
                {
                    Caption = 'BUYER ORDER ASSIGN ID';
                    ApplicationArea = All;
                }
                field("H13-BUYER_ORDER_ISSUE_DTM"; Rec."H13-BUYER_ORDER_ISSUE_DTM")
                {
                    Caption = 'BUYER ORDER ISSUE DTM';
                    ApplicationArea = All;
                }
                field("H14-BUYER_ORDER_REF_TYPE_CODE"; Rec."H14-BUYER_ORDER_REF_TYPE_CODE")
                {
                    Caption = 'BUYER ORDER TYPE CODE';
                    ApplicationArea = All;
                }
                field("H15-DOCUMENT_REMARK"; Rec."H15-DOCUMENT_REMARK")
                {
                    Caption = 'DOCUMENT REMARK';
                    ApplicationArea = All;
                }
                field("H16-VOUCHER_NO"; Rec."H16-VOUCHER_NO")
                {
                    Caption = 'VOUCHER NO';
                    ApplicationArea = All;
                }
                field("H17-SELLER_CONTACT_PERSON_NAME"; Rec."H17-SELLER_CONTACT_PERSON_NAME")
                {
                    Caption = 'SELLER CONTACT PERSON NAME';
                    ApplicationArea = All;
                }
                field("H18-SELLER_CONTACT_DEPARTMENT_NAME"; Rec."H18-SELLER_CONTACT_DEPARTMENT_NAME")
                {
                    Caption = 'SELLER CONTACT DEPARTMENT NAME';
                    ApplicationArea = All;
                }
                field("H19-SELLER_CONTACT_URIID"; Rec."H19-SELLER_CONTACT_URIID")
                {
                    Caption = 'SELLER CONTACT URIID';
                    ApplicationArea = All;
                }
                field("H20-SELLER_CONTACT_PHONE_NO"; Rec."H20-SELLER_CONTACT_PHONE_NO")
                {
                    Caption = 'SELLER CONTACT PHONE NO';
                    ApplicationArea = All;
                }
                field("H21-FLEX_FIELD"; Rec."H21-FLEX_FIELD")
                {
                    Caption = 'FLEX FIELD';
                    ApplicationArea = All;
                }
                field("H22-SELLER_BRANCH_ID"; Rec."H22-SELLER_BRANCH_ID")
                {
                    Caption = 'SELLER BRANCH ID';
                    ApplicationArea = All;
                }
                field("H23-SOURCE_SYSTEM"; Rec."H23-SOURCE_SYSTEM")
                {
                    Caption = 'SOURCE SYSTEM';
                    ApplicationArea = All;
                }
                field("H24-ENCRYPT_PASSWORD"; Rec."H24-ENCRYPT_PASSWORD")
                {
                    Caption = 'ENCRYPT PASSWORD';
                    ApplicationArea = All;
                }
                field("H25-PDF_TEMPLATE_ID"; Rec."H25-PDF_TEMPLATE_ID")
                {
                    Caption = 'PDF TEMPLATE ID';
                    ApplicationArea = All;
                }
                field("H26-SEND_MAIL_IND"; Rec."H26-SEND_MAIL_IND")
                {
                    Caption = 'SEND MAIL IND';
                    ApplicationArea = All;
                }
                field("H27-PDF_NAME"; Rec."H27-PDF_NAME")
                {
                    Caption = 'PDF NAME';
                    ApplicationArea = All;
                }
            }
            group(B)
            {
                field("B01-BUYER_ID"; Rec."B01-BUYER_ID")
                {
                    Caption = 'BUYER ID';
                    ApplicationArea = All;
                }
                field("B02-BUYER_NAME"; Rec."B02-BUYER_NAME")
                {
                    Caption = 'BUYER NAME';
                    ApplicationArea = All;
                }
                field("B03-BUYER_TAX_ID_TYPE"; Rec."B03-BUYER_TAX_ID_TYPE")
                {
                    Caption = 'BUYER TAX ID TYPE';
                    ApplicationArea = All;
                }
                field("B04-BUYER_TAX_ID"; Rec."B04-BUYER_TAX_ID")
                {
                    Caption = 'BUYER TAX ID';
                    ApplicationArea = All;
                }
                field("B05-BUYER_BRANCH_ID"; Rec."B05-BUYER_BRANCH_ID")
                {
                    Caption = 'BUYER BRANCH ID';
                    ApplicationArea = All;
                }
                field("B06-BUYER_CONTACT_PERSON_NAME"; Rec."B06-BUYER_CONTACT_PERSON_NAME")
                {
                    Caption = 'BUYER CONTACT PERSON NAME';
                    ApplicationArea = All;
                }
                field("B07-BUYER_CONTACT_DEPARTMENT_NAME"; Rec."B07-BUYER_CONTACT_DEPARTMENT_NAME")
                {
                    Caption = 'BUYER CONTACT DEPARTMENT NAME';
                    ApplicationArea = All;
                }
                field("B08-BUYER_URIID"; Rec."B08-BUYER_URIID")
                {
                    Caption = 'BUYER URIID';
                    ApplicationArea = All;
                }
                field("B09-BUYER_CONTACT_PHONE_NO"; Rec."B09-BUYER_CONTACT_PHONE_NO")
                {
                    Caption = 'BUYER CONTACT PHONE NO';
                    ApplicationArea = All;
                }
                field("B10-BUYER_POST_CODE"; Rec."B10-BUYER_POST_CODE")
                {
                    Caption = 'BUYER POST CODE';
                    ApplicationArea = All;
                }
                field("B11-BUYER_BUILDING_NAME"; Rec."B11-BUYER_BUILDING_NAME")
                {
                    Caption = 'BUYER BUILDING NAME';
                    ApplicationArea = All;
                }
                field("B12-BUYER_BUILDING_NO"; Rec."B12-BUYER_BUILDING_NO")
                {
                    Caption = 'BUYER BUILDING NO';
                    ApplicationArea = All;
                }
                field("B13-BUYER_ADDRESS_LINE1"; Rec."B13-BUYER_ADDRESS_LINE1")
                {
                    Caption = 'BUYER ADDRESS LINE1';
                    ApplicationArea = All;
                }
                field("B14-BUYER_ADDRESS_LINE2"; Rec."B14-BUYER_ADDRESS_LINE2")
                {
                    Caption = 'BUYER ADDRESS LINE2';
                    ApplicationArea = All;
                }
                field("B15-BUYER_ADDRESS_LINE3"; Rec."B15-BUYER_ADDRESS_LINE3")
                {
                    Caption = 'BUYER ADDRESS LINE3';
                    ApplicationArea = All;
                }
                field("B16-BUYER_ADDRESS_LINE4"; Rec."B16-BUYER_ADDRESS_LINE4")
                {
                    Caption = 'BUYER ADDRESS LINE4';
                    ApplicationArea = All;
                }
                field("B17-BUYER_ADDRESS_LINE5"; Rec."B17-BUYER_ADDRESS_LINE5")
                {
                    Caption = 'BUYER ADDRESS LINE5';
                    ApplicationArea = All;
                }
                field("B18-BUYER_STREET_NAME"; Rec."B18-BUYER_STREET_NAME")
                {
                    Caption = 'BUYER STREET NAME';
                    ApplicationArea = All;
                }
                field("B19-BUYER_CITY_SUB_DIV_ID"; Rec."B19-BUYER_CITY_SUB_DIV_ID")
                {
                    Caption = 'BUYER CITY SUB DIV ID';
                    ApplicationArea = All;
                }
                field("B20-BUYER_CITY_SUB_DIV_NAME"; Rec."B20-BUYER_CITY_SUB_DIV_NAME")
                {
                    Caption = 'BUYER CITY SUB DIV NAME';
                    ApplicationArea = All;
                }
                field("B21-BUYER_CITY_ID"; Rec."B21-BUYER_CITY_ID")
                {
                    Caption = 'BUYER CITY ID';
                    ApplicationArea = All;
                }
                field("B22-BUYER_CITY_NAME"; Rec."B22-BUYER_CITY_NAME")
                {
                    Caption = 'BUYER CITY NAME';
                    ApplicationArea = All;
                }
                field("B23-BUYER_COUNTRY_SUB_DIV_ID"; Rec."B23-BUYER_COUNTRY_SUB_DIV_ID")
                {
                    Caption = 'BUYER COUNTRY SUB DIV ID';
                    ApplicationArea = All;
                }
                field("B24-BUYER_COUNTRY_SUB_DIV_NAME"; Rec."B24-BUYER_COUNTRY_SUB_DIV_NAME")
                {
                    Caption = 'BUYER COUNTRY SUB DIV NAME';
                    ApplicationArea = All;
                }
                field("B25-BUYER_COUNTRY_ID"; Rec."B25-BUYER_COUNTRY_ID")
                {
                    Caption = 'BUYER COUNTRY ID';
                    ApplicationArea = All;
                }
            }
            group(O)
            {
                field("O01-SHIP_TO_ID"; Rec."O01-SHIP_TO_ID")
                {
                    Caption = 'SHIP TO ID';
                    ApplicationArea = All;
                }
                field("O02-SHIP_TO_NAME"; Rec."O02-SHIP_TO_NAME")
                {
                    Caption = 'SHIP TO NAME';
                    ApplicationArea = All;
                }
                field("O03-SHIP_TO_TAX_ID_TYPE"; Rec."O03-SHIP_TO_TAX_ID_TYPE")
                {
                    Caption = 'SHIP TO TAX ID TYPE';
                    ApplicationArea = All;
                }
                field("O04-SHIP_TO_TAX_ID"; Rec."O04-SHIP_TO_TAX_ID")
                {
                    Caption = 'SHIP TO TAX ID';
                    ApplicationArea = All;
                }
                field("O05-SHIP_TO_BRANCH_ID"; Rec."O05-SHIP_TO_BRANCH_ID")
                {
                    Caption = 'SHIP TO BRANCH ID';
                    ApplicationArea = All;
                }
                field("O06-SHIP_TO_CONTACT_PERSON_NAME"; Rec."O06-SHIP_TO_CONTACT_PERSON_NAME")
                {
                    Caption = 'SHIP TO CONTACT PERSON NAME';
                    ApplicationArea = All;
                }
                field("O07-SHIP_TO_CONTACT_DEPARTMENT_NAME"; Rec."O07-SHIP_TO_CONTACT_DEPARTMENT_NAME")
                {
                    Caption = 'SHIP TO CONTACT DEPARTMENT NAME';
                    ApplicationArea = All;
                }
                field("O08-SHIP_TO_URIID"; Rec."O08-SHIP_TO_URIID")
                {
                    Caption = 'SHIP TO URIID';
                    ApplicationArea = All;
                }
                field("O09-SHIP_TO_PHONE_NO"; Rec."O09-SHIP_TO_PHONE_NO")
                {
                    Caption = 'SHIP TO PHONE NO';
                    ApplicationArea = All;
                }
                field("O10-SHIP_TO_POST_CODE"; Rec."O10-SHIP_TO_POST_CODE")
                {
                    Caption = 'SHIP TO POST CODE';
                    ApplicationArea = All;
                }
                field("O11-SHIP_TO_BUILDING_NAME"; Rec."O11-SHIP_TO_BUILDING_NAME")
                {
                    Caption = 'SHIP TO BUILDING NAME';
                    ApplicationArea = All;
                }
                field("O12-SHIP_TO_BUILDING_NO"; Rec."O12-SHIP_TO_BUILDING_NO")
                {
                    Caption = 'SHIP TO BUILDING NO';
                    ApplicationArea = All;
                }
                field("O13-SHIP_TO_ADDRESS_LINE1"; Rec."O13-SHIP_TO_ADDRESS_LINE1")
                {
                    Caption = 'SHIP TO ADDRESS LINE1';
                    ApplicationArea = All;
                }
                field("O14-SHIP_TO_ADDRESS_LINE2"; Rec."O14-SHIP_TO_ADDRESS_LINE2")
                {
                    Caption = 'SHIP TO ADDRESS LINE2';
                    ApplicationArea = All;
                }
                field("O15-SHIP_TO_ADDRESS_LINE3"; Rec."O15-SHIP_TO_ADDRESS_LINE3")
                {
                    Caption = 'SHIP TO ADDRESS LINE3';
                    ApplicationArea = All;
                }
                field("O16-SHIP_TO_ADDRESS_LINE4"; Rec."O16-SHIP_TO_ADDRESS_LINE4")
                {
                    Caption = 'SHIP TO ADDRESS LINE4';
                    ApplicationArea = All;
                }
                field("O17-SHIP_TO_ADDRESS_LINE5"; Rec."O17-SHIP_TO_ADDRESS_LINE5")
                {
                    Caption = 'SHIP TO ADDRESS LINE5';
                    ApplicationArea = All;
                }
                field("O18-SHIP_TO_STREET_NAME"; Rec."O18-SHIP_TO_STREET_NAME")
                {
                    Caption = 'SHIP TO STREET NAME';
                    ApplicationArea = All;
                }
                field("O19-SHIP_TO_CITY_SUB_DIV_ID"; Rec."O19-SHIP_TO_CITY_SUB_DIV_ID")
                {
                    Caption = 'SHIP TO CITY SUB DIV ID';
                    ApplicationArea = All;
                }
                field("O20-SHIP_TO_CITY_SUB_DIV_NAME"; Rec."O20-SHIP_TO_CITY_SUB_DIV_NAME")
                {
                    Caption = 'SHIP TO CITY SUB DIV NAME';
                    ApplicationArea = All;
                }
                field("O21-SHIP_TO_CITY_ID"; Rec."O21-SHIP_TO_CITY_ID")
                {
                    Caption = 'SHIP TO CITY ID';
                    ApplicationArea = All;
                }
                field("O22-SHIP_TO_CITY_NAME"; Rec."O22-SHIP_TO_CITY_NAME")
                {
                    Caption = 'SHIP TO CITY NAME';
                    ApplicationArea = All;
                }
                field("O23-SHIP_TO_COUNTRY_SUB_DIV_ID"; Rec."O23-SHIP_TO_COUNTRY_SUB_DIV_ID")
                {
                    Caption = 'SHIP TO COUNTRY SUB DIV ID';
                    ApplicationArea = All;
                }
                field("O24-SHIP_TO_COUNTRY_SUB_DIV_NAME"; Rec."O24-SHIP_TO_COUNTRY_SUB_DIV_NAME")
                {
                    Caption = 'SHIP TO COUNTRY SUB DIV NAME';
                    ApplicationArea = All;
                }
                field("O25-SHIP_TO_COUNTRY_ID"; Rec."O25-SHIP_TO_COUNTRY_ID")
                {
                    Caption = 'SHIP TO COUNTRY ID';
                    ApplicationArea = All;
                }
            }
            part(PageLine; "PageLine")
            {
                ApplicationArea = Jobs;
                Caption = 'Tasks';
                SubPageLink = "idBody" = FIELD(idBody);
            }
            group(UserControlGroup)
            {
                Caption = 'Response';
                Editable = false;
                usercontrol(Response; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(API)
            {
                /*ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                PromotedIsBig = true;
                Image = SendTo;*/
                /*var
                    Json: Codeunit "Json Tools";
                begin
                    Rec.FindFirst();
                    Message('%1', Json.Rec2Json(Rec));
                end;*/
                /*var
                    Tools: Codeunit "Json Tools";
                begin
                    Message('%1', format(Tools.API2Json('0')));
                end;*/
                ApplicationArea = All;
                PromotedCategory = Process;
                Promoted = true;
                PromotedIsBig = true;
                Image = SendTo;
                trigger OnAction()
                var
                    cuEtaxAPI: Codeunit "E-Tax API";
                    tblAPISetup: Record "API Setup";
                    tblAPIResponse: Record "API Response";
                    tblSalesInvoiceHeader: Record "Sales Invoice Header";
                    cuTools: Codeunit "Json Tools";
                begin
                    tblAPISetup.Get();
                    //cuEtaxAPI.z_SendRequest(tblAPISetup, m_Response);
                    m_Status := cuEtaxAPI.z_SendRequest(tblAPISetup, m_Response);
                    Message(m_Status);
                    m_JsonBody := format(cuTools.z_API2Json('0'));
                    //Message(cuEtaxAPI.z_SendRequest(tblAPISetup, m_Response));
                    if m_Response <> '' then
                        z_FillAddInResponse();
                    //tblAPIResponse.SetResponseBlob(m_Response);
                    //tblAPIResponse.GetResponseBlob();
                    tblAPIResponse.Init();
                    tblAPIResponse.EntryNo := 0;
                    tblAPIResponse.URL := tblAPISetup.URL;
                    tblAPIResponse.Method := tblAPISetup.Method;
                    tblAPIResponse.SetResponseBlob(m_Response);
                    tblAPIResponse.SetJsonBodyBlob(m_JsonBody);
                    //tblAPIResponse.Response := m_Response;
                    tblAPIResponse.ETaxID := Rec.idBody;
                    tblAPIResponse.InvoiceNumber := tblSalesInvoiceHeader."No.";
                    tblAPIResponse.Insert(true);
                    //Message('%1', format(cuTools.z_API2Json('0')));
                end;
            }
        }
    }
    var
        m_Response: Text;
        m_Status: Text;
        m_JsonBody: Text;
    // RequestBody: Text;
    trigger OnAfterGetCurrRecord()
    begin
        z_FillAddInResponse();
    end;
    /*local procedure FillAddInRequest()
    var
        Json: Codeunit "Json Tools";
    begin
    end;*/

    local procedure z_FillAddInResponse()
    begin
        CurrPage.Response.SetContent(StrSubstNo('<textarea Id="TextArea" maxlength="%2" style="width:100%;height:100%;resize: none; font-family:"Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif !important; font-size: 10.5pt !important;" OnChange="window.parent.WebPageViewerHelper.TriggerCallback(document.getElementById(''TextArea'').value)">%1</textarea>', m_Response, MaxStrLen(m_Response)));
    end;

    /*procedure API2Json(id: Integer): JsonObject
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
        Tools: Codeunit "Json Tools";
    begin
        Task.Setrange(idHeader, LINEID);
        if Task.FindSet() then
            repeat
                Line.SetRange(idHeader, LINEID);
                Line.SetRange(idBody, Task.idBody);
                JO := Tools.Rec2Json(Task, 3);
                JO.Add('LINE_ITEM_INFORMATION', Line2Json(Task));
            //JA.Add(JO);
            until Task.Next() = 0;
        exit(JO);
    end;

    procedure Line2Json(Task: Record "API Body"): JsonArray
    var
        JA: JsonArray;
        JLE: Record "API Line";
        Tools: Codeunit "Json Tools";
    begin
        JLE.Setrange("idBody", Task.idBody);
        JLE.Setrange("idHeader", Task.idHeader);
        if JLE.FindSet() then
            repeat
                JA.Add(Tools.Rec2Json(JLE, 4));
            until JLE.Next() = 0;
        exit(JA);
    end;*/
}