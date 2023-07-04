report 60000 "Posted Sale Invoice"
{
    Caption = 'Posted Sale Invoice Report';
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'src\reportlayout\Rep60000.PostedSaleInvoice.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Header; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            column(SIH_No; "No.")
            {

            }
            /*column(SIH_No; "No.")
            {

            }
            column(SIH_No; "No.")
            {

            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }
            column(SIH_No;"No.")
            {
                
            }*/
            dataitem(Line; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(LineNo_Line; "Line No.")
                {
                }
                column(Description_Line; Description)
                {
                }
            }
        }
    }
    /*
    requestpage
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
    var
        GLSetup: Record "General Ledger Setup";
        CompanyInfo: Record "Company Information";
}