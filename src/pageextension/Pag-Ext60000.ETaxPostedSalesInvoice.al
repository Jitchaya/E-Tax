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
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    cuTools: Codeunit "Json Tools";
                    tblAPIBody: Record "API Body";
                    tblAPILine: Record "API Line";
                    tblSaleInvoiceLine: Record "Sales Invoice Line";
                    cuETaxAPI: Codeunit "E-Tax API";
                    tblAPISetup: Record "API Setup";
                    tblAPIResponse: Record "API Response";
                    count: Integer;
                begin
                    tblAPISetup.Get();
                    tblAPIBody.Init();
                    //tblAPIBody.TransferFields(Rec);
                    tblAPIBody."C01-SELLER_TAX_ID" := tblAPISetup.SellerTaxId;
                    tblAPIBody."C02-SELLER_BRANCH_ID" := tblAPISetup.SellerBranchId;
                    tblAPIBody."C03-FILE_NAME" := Rec."Sell-to Customer No.";
                    tblAPIBody."H01-DOCUMENT_TYPE_CODE" := 'T02';
                    tblAPIBody."H02-DOCUMENT_NAME" := 'ใบแจ้งหนี้/ใบกำกับภาษี';
                    tblAPIBody."H03-DOCUMENT_ID" := 'IV230304649';
                    tblAPIBody."H04-DOCUMENT_ISSUE_DTM" := format(CurrentDateTime, 0, 9).Substring(1, 19);
                    tblAPIBody."H12-BUYER_ORDER_ASSIGN_ID" := Rec."Order No.";
                    tblAPIBody."H17-SELLER_CONTACT_PERSON_NAME" := Rec."Sell-to Contact";
                    tblAPIBody."H26-SEND_MAIL_IND" := 'N';
                    tblAPIBody."B01-BUYER_ID" := Rec."No.";
                    tblAPIBody."B02-BUYER_NAME" := Rec."Sell-to Customer Name";
                    tblAPIBody."B03-BUYER_TAX_ID_TYPE" := 'TXID';
                    tblAPIBody."B04-BUYER_TAX_ID" := '0525537000518';
                    tblAPIBody."B05-BUYER_BRANCH_ID" := '00000';
                    tblAPIBody."B06-BUYER_CONTACT_PERSON_NAME" := Rec."Sell-to Contact";
                    tblAPIBody."B10-BUYER_POST_CODE" := Rec."Sell-to Post Code";
                    tblAPIBody."B13-BUYER_ADDRESS_LINE1" := Rec."Sell-to Address";
                    tblAPIBody."B25-BUYER_COUNTRY_ID" := Rec."Sell-to Country/Region Code";
                    tblAPIBody."F01-LINE_TOTAL_COUNT" := '0';
                    tblAPIBody."F03-INVOICE_CURRENCY_CODE" := Rec."Currency Code";
                    tblAPIBody."F04-TAX_TYPE_CODE1" := 'VAT';
                    tblAPIBody."F05-TAX_CAL_RATE1" := format(Rec."VAT Base Discount %");
                    tblAPIBody."F06-BASIS_AMOUNT1" := '0';
                    tblAPIBody."F07-BASIS_CURRENCY_CODE1" := Rec."Currency Code";
                    tblAPIBody."F08-TAX_CAL_AMOUNT1" := '195.55';
                    tblAPIBody."F09-TAX_CAL_CURRENCY_CODE1" := Rec."Currency Code";
                    tblAPIBody."F36-ORIGINAL_TOTAL_AMOUNT" := '2793.60';
                    tblAPIBody."F37-ORIGINAL_TOTAL_CURRENCY_CODE" := Rec."Currency Code";
                    tblAPIBody."F38-LINE_TOTAL_AMOUNT" := '2793.60';
                    tblAPIBody."F39-LINE_TOTAL_CURRENCY_CODE" := 'THB';
                    tblAPIBody."F46-TAX_BASIS_TOTAL_AMOUNT" := '0';
                    tblAPIBody."F47-TAX_BASIS_TOTAL_CURRENCY_CODE" := Rec."Currency Code";
                    tblAPIBody."F48-TAX_TOTAL_AMOUNT" := '1419.50';
                    tblAPIBody."F49-TAX_TOTAL_CURRENCY_CODE" := Rec."Currency Code";
                    tblAPIBody."F50-GRAND_TOTAL_AMOUNT" := '0';
                    tblAPIBody."F51-GRAND_TOTAL_CURRENCY_CODE" := Rec."Currency Code";
                    tblAPIBody."T01-TOTAL_DOCUMENT_COUNT" := '1';
                    tblAPIBody.Insert();
                    tblAPILine.Init();
                    tblSaleInvoiceLine.Reset();
                    tblSaleInvoiceLine.SetRange("Document No.", Rec."No.");
                    count := 0;
                    if tblSaleInvoiceLine.FindSet() then
                        repeat
                            count := count + 1;
                            //tblAPILine.TransferFields(tblSaleInvoiceLine);
                            tblAPILine."L01-LINE_ID" := format(count);
                            tblAPILine."L02-PRODUCT_ID" := tblSaleInvoiceLine."No.";
                            tblAPILine."L03-PRODUCT_NAME" := tblSaleInvoiceLine.Description;
                            tblAPILine."L10-PRODUCT_CHARGE_AMOUNT" := format(round(tblSaleInvoiceLine."Unit Price", 0.01)).Replace(',', '');
                            tblAPILine."L11-PRODUCT_CHARGE_CURRENCY_CODE" := Rec."Currency Code";
                            tblAPILine."L17-PRODUCT_QUANTITY" := format(tblSaleInvoiceLine.Quantity);
                            tblAPILine."L18-PRODUCT_UNIT_CODE" := tblSaleInvoiceLine."Unit of Measure Code";
                            tblAPILine."L19-PRODUCT_QUANTITY_PER_UNIT" := Format(tblSaleInvoiceLine."Qty. per Unit of Measure");
                            tblAPILine."L20-LINE_TAX_TYPE_CODE" := 'VAT'/*tblSaleInvoiceLine."VAT Prod. Posting Group"*/;
                            tblAPILine."L21-LINE_TAX_CAL_RATE" := Format(tblSaleInvoiceLine."VAT %");
                            tblAPILine."L22-LINE_BASIS_AMOUNT" := format(round(tblSaleInvoiceLine.Amount, 0.01)).Replace(',', '');
                            tblAPILine."L23-LINE_BASIS_CURRENCY_CODE" := Rec."Currency Code";
                            tblAPILine."L24-LINE_TAX_CAL_AMOUNT" := format(tblSaleInvoiceLine."Amount Including VAT" - tblSaleInvoiceLine.Amount);
                            tblAPILine."L25-LINE_TAX_CAL_CURRENCY_CODE" := Rec."Currency Code";
                            tblAPILine."L33-LINE_NET_TOTAL_AMOUNT" := '0';
                            tblAPILine."L34-LINE_NET_TOTAL_CURRENCY_CODE" := Rec."Currency Code";
                            tblAPILine."L35-LINE_NET_INCLUDE_TAX_TOTAL_AMOUNT" := format(round(tblSaleInvoiceLine."Amount Including VAT", 0.01)).Replace(',', '');
                            tblAPILine."L36-LINE_NET_INCLUDE_TAX_TOTAL_CURRENCY_CODE" := Rec."Currency Code";
                            tblAPILine.idBody := tblAPIBody.idBody;
                            tblAPILine.idLine := 0;
                            //tblAPIBody."F06-BASIS_AMOUNT1" := tblAPILine."L22-LINE_BASIS_AMOUNT";
                            //tblAPIBody.Modify();
                            tblAPILine.Insert();
                        until tblSaleInvoiceLine.Next() = 0;
                    tblAPIBody."F01-LINE_TOTAL_COUNT" := Format(count);
                    tblAPIBody.Modify();
                    Message(format(tblAPILine.idBody));
                    tblAPISetup.Get();
                    m_Status := cuEtaxAPI.z_SendRequest(tblAPISetup, m_Response, tblAPIBody.idBody);
                    Message(m_Status);
                    m_JsonBody := format(cuTools.z_API2Json('0', tblAPIBody.idBody));
                    //Message(cuETaxAPI.z_SendRequest(tblAPISetup, m_Response));
                    if m_Response <> '' then
                        //FillAddInResponse();
                        Message((StrSubstNo(m_Response, MaxStrLen(m_Response))));
                    tblAPIResponse.Init();
                    tblAPIResponse.EntryNo := 0;
                    tblAPIResponse.URL := tblAPISetup.URL;
                    tblAPIResponse.Method := tblAPISetup.Method;
                    tblAPIResponse.SetResponseBlob(m_Response);
                    tblAPIResponse.SetJsonBodyBlob(m_JsonBody);
                    tblAPIResponse.ETaxID := tblAPIBody.idBody;
                    tblAPIResponse.InvoiceNumber := Rec."No.";
                    //tblAPIResponse.Response := m_Response;
                    tblAPIResponse.Insert(true);
                    //Message(format(tblAPIBody.idBody));
                    Message('%1', format(cuTools.z_API2Json('0', tblAPIBody.idBody)));
                end;
            }
            action(Test)
            {
                ApplicationArea = All;
                Image = Invoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //Image = ExportElectronicDocument;
                trigger OnAction()
                var
                    rptSalesInvoice: Report "Posted Sale Invoice";
                //ExportExample: Codeunit TextFile;
                begin
                    //ExportExample.SendText();
                    CurrPage.SetSelectionFilter(Rec);
                    Report.Run(Report::"Posted Sale Invoice", true, true, Rec);
                end;
            }
        }
    }
    var
        m_Response: Text;
        m_Status: Text;
        m_JsonBody: Text;

    trigger OnAfterGetCurrRecord()
    begin
        //FillAddInResponse();
    end;
    /*local procedure FillAddInResponse()
    begin
        CurrPage.Response.SetContent(StrSubstNo('<textarea Id="TextArea" maxlength="%2" style="width:100%;height:100%;resize: none; font-family:"Segoe UI", "Segoe WP", Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif !important; font-size: 10.5pt !important;" OnChange="window.parent.WebPageViewerHelper.TriggerCallback(document.getElementById(''TextArea'').value)">%1</textarea>', Response, MaxStrLen(Response)));
    end;*/
}