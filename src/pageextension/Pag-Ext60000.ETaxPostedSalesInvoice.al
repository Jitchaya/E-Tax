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
                    tblAPIBody.Init();
                    tblAPIBody.TransferFields(Rec);
                    tblAPIBody.Insert();
                    tblAPILine.Init();
                    tblSaleInvoiceLine.Reset();
                    tblSaleInvoiceLine.SetRange("Document No.", Rec."No.");
                    if tblSaleInvoiceLine.FindSet() then
                        repeat
                            tblAPILine.TransferFields(tblSaleInvoiceLine);
                            //tblAPILine."L02-PRODUCT_ID" := tblSaleInvoiceLine."No.";
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
                    tblAPIResponse.URL := tblAPISetup.URL;
                    tblAPIResponse.Method := tblAPISetup.Method;
                    tblAPIResponse.Response := m_Response;
                    tblAPIResponse.Insert(true);
                    //Message(format(tblAPIBody.idBody));
                    //Message('%1', format(cuTools.API2Json('0')));
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