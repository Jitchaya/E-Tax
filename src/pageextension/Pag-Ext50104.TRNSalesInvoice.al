pageextension 50104 "TRN_Sales Invoice" extends "Sales Invoice"
{
    layout
    {

    }
    actions
    {
        addafter(ProformaInvoice)
        {
            action("TRN_Sales Invoice")
            {
                Caption = 'TRN_Sales Invoice';
                ApplicationArea = all;
                Image = Invoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    tblSalesHeader: Record "Sales Header";
                    rptTRNSalesInvoice: Report "TRN_Sales Invoice";
                begin
                    CurrPage.SetSelectionFilter(tblSalesHeader);
                    //1
                    Report.Run(Report::"TRN_Sales Invoice", true, true, tblSalesHeader);
                    //2
                    rptTRNSalesInvoice.SetTableView(tblSalesHeader);
                    rptTRNSalesInvoice.Run();
                end;
            }
        }
    }
}