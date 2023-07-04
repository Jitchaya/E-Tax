report 50101 "TRN_Sales Invoice"
{
    Caption = 'TRN Sales Invoice';
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'src\reportlayout\Rep50101.TRN_SalesInvoice.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = where("Document Type" = filter(Invoice));

            column(No_; "No.")
            {

            }
            column(Sell_to_Customer_No_; "Sell-to Customer No.")
            {

            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"),
                "Document No." = field("No.");

                column(ItemNo_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
            }
        }
    }

    /*requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                        
                    }
                }
            }
        }
    }*/
}