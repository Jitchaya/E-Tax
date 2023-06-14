pageextension 60000 "Love" extends "Posted Sales Invoice"
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
                    Tools: Codeunit "Json Tools";
                    RecBody: Record "API Body";
                    RecLine: Record "API Line";
                    SaleLine: Record "Sales Invoice Line";
                    HandleRequest: Codeunit "ETax API Test";
                    Setup: Record "API Setup";
                    RecAPIResponse: Record "API Response";
                begin
                    RecBody.Init();
                    RecBody.TransferFields(Rec);
                    RecBody.Insert();
                    RecLine.Init();
                    SaleLine.Reset();
                    SaleLine.SetRange("Document No.", Rec."No.");
                    if SaleLine.FindSet() then
                        repeat
                            RecLine.TransferFields(SaleLine);
                            //RecLine."L02-PRODUCT_ID" := SaleLine."No.";
                            RecLine.idBody := RecBody.idBody;
                            RecLine.idLine := 0;
                            RecLine.Insert();
                        until SaleLine.Next() = 0;
                    Message(format(RecLine.idBody));
                    Setup.Get();
                    Message(HandleRequest.SendRequest(Setup, response));
                    if Response <> '' then
                        //FillAddInResponse();
                        Message((StrSubstNo(Response, MaxStrLen(Response))));
                    RecAPIResponse.Init();
                    RecAPIResponse.URL := Setup.URL;
                    RecAPIResponse.Method := Setup.Method;
                    RecAPIResponse.Response := Response;
                    RecAPIResponse.Insert(true);
                    //Message(format(RecBody.idBody));
                    //Message('%1', format(Tools.API2Json('0')));
                end;
            }
        }
    }
    var
        Response: Text;
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