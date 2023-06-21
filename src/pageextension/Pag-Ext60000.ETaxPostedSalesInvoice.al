pageextension 60000 "ETax Posted Sales Invoice" extends "Posted Sales Invoice"
{
    actions
    {
        addafter("Update Document")
        {
            action("Postman")
            {
                Caption = 'Postman';
                ToolTip = 'Postman E-Tax';
                ApplicationArea = All;
                Image = SendTo;

                trigger OnAction()
                var
                    cuTools: Codeunit "Json Tools";
                    tblAPIBody: Record "API Body";
                    tblAPILine: Record "API Line";
                    tblSaleInvoiceLine: Record "Sales Invoice Line";
                    cuETaxAPI: Codeunit "E-Tax API";
                    tblAPISetup: Record "API Setup";
                    tblAPIResponse: Record "API Response";
                begin
                    tblAPISetup.Get();
                    tblAPIBody.Init();
                    //tblAPIBody.TransferFields(Rec);
                    tblAPIBody."C01-SELLER_TAX_ID" := tblAPISetup.SellerTaxId;
                    tblAPIBody."C02-SELLER_BRANCH_ID" := tblAPISetup.SellerBranchId;
                    tblAPIBody."C03-FILE_NAME" := Rec."Sell-to Customer No.";
                    tblAPIBody."H01-DOCUMENT_TYPE_CODE" := 'T02';
                    tblAPIBody."H03-DOCUMENT_ID" := 'IV230304129';
                    tblAPIBody."H04-DOCUMENT_ISSUE_DTM" := '2023-03-01T09:47:15';
                    tblAPIBody."H26-SEND_MAIL_IND" := 'N';
                    tblAPIBody."B01-BUYER_ID" := Rec."No.";
                    tblAPIBody."B02-BUYER_NAME" := Rec."Sell-to Customer Name";
                    tblAPIBody."B03-BUYER_TAX_ID_TYPE" := 'TXID';
                    tblAPIBody."B04-BUYER_TAX_ID" := tblAPISetup.SellerTaxId;
                    tblAPIBody."B25-BUYER_COUNTRY_ID" := 'TH';
                    tblAPIBody."F01-LINE_TOTAL_COUNT" := '1';
                    tblAPIBody."F03-INVOICE_CURRENCY_CODE" := 'THB';
                    tblAPIBody."F04-TAX_TYPE_CODE1" := 'VAT';
                    tblAPIBody."F06-BASIS_AMOUNT1" := '2793.60';
                    tblAPIBody."F07-BASIS_CURRENCY_CODE1" := 'THB';
                    tblAPIBody."F08-TAX_CAL_AMOUNT1" := '195.55';
                    tblAPIBody."F09-TAX_CAL_CURRENCY_CODE1" := 'THB';
                    tblAPIBody."F36-ORIGINAL_TOTAL_AMOUNT" := '2793.60';
                    tblAPIBody."F37-ORIGINAL_TOTAL_CURRENCY_CODE" := 'THB';
                    tblAPIBody."F38-LINE_TOTAL_AMOUNT" := '2793.60';
                    tblAPIBody."F39-LINE_TOTAL_CURRENCY_CODE" := 'THB';
                    tblAPIBody."F46-TAX_BASIS_TOTAL_AMOUNT" := '20278.50';
                    tblAPIBody."F47-TAX_BASIS_TOTAL_CURRENCY_CODE" := 'THB';
                    tblAPIBody."F48-TAX_TOTAL_AMOUNT" := '1419.50';
                    tblAPIBody."F49-TAX_TOTAL_CURRENCY_CODE" := 'THB';
                    tblAPIBody."F50-GRAND_TOTAL_AMOUNT" := '21698.00';
                    tblAPIBody."F51-GRAND_TOTAL_CURRENCY_CODE" := 'THB';
                    tblAPIBody."T01-TOTAL_DOCUMENT_COUNT" := '1';
                    tblAPIBody.Insert();
                    tblAPILine.Init();
                    tblSaleInvoiceLine.Reset();
                    tblSaleInvoiceLine.SetRange("Document No.", Rec."No.");
                    if tblSaleInvoiceLine.FindSet() then
                        repeat
                            //tblAPILine.TransferFields(tblSaleInvoiceLine);
                            tblAPILine."L02-PRODUCT_ID" := tblSaleInvoiceLine."No.";
                            tblAPILine.idBody := tblAPIBody.idBody;
                            tblAPILine.idLine := 0;
                            tblAPILine.Insert();
                        until tblSaleInvoiceLine.Next() = 0;
                    Message(format(tblAPILine.idBody));
                    tblAPISetup.Get();
                    Message(cuETaxAPI.z_SendRequest(tblAPISetup, m_Response));
                    if m_Response <> '' then
                        //FillAddInResponse();
                        Message((StrSubstNo(m_Response, MaxStrLen(m_Response))));
                    tblAPIResponse.Init();
                    tblAPIResponse.EntryNo := 0;
                    tblAPIResponse.URL := tblAPISetup.URL;
                    tblAPIResponse.Method := tblAPISetup.Method;
                    tblAPIResponse.SetResponseBlob(m_Response);
                    tblAPIResponse.ETaxID := tblAPIBody.idBody;
                    tblAPIResponse.InvoiceNumber := Rec."No.";
                    //tblAPIResponse.Response := m_Response;
                    tblAPIResponse.Insert(true);
                    //Message(format(tblAPIBody.idBody));
                    Message('%1', format(cuTools.z_API2Json('0')));
                end;
            }
        }
    }
    var
        m_Response: Text;
    // RequestBody: Text;
    trigger OnAfterGetCurrRecord()
    begin
        //FillAddInResponse();
    end;
    /*local procedure FillAddInResponse()
    begin
        CurrPage.Response.SetContent(StrSubstNo('<textarea Id="TextArea" maxlength="%2" style="width:100%;height:100%;resize: none; font-family:"Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif !important; font-size: 10.5pt !important;" OnChange="window.parent.WebPageViewerHelper.TriggerCallback(document.getElementById(''TextArea'').value)">%1</textarea>', Response, MaxStrLen(Response)));
    end;*/
}