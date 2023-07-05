report 60000 "Posted Sale Invoice"
{
    Caption = 'Posted Sale Invoice Report';
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'src\reportlayout\Rep60000.PostedSaleInvoice.rdl';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");

            column(Company_Name; tblCompanyInfo.Name)
            {
            }
            column(Company_Name2; tblCompanyInfo."Name 2")
            {
            }
            column(Company_Address; tblCompanyInfo.Address)
            {
            }
            column(Company_Address2; tblCompanyInfo."Address 2")
            {
            }
            column(Company_Phone; tblCompanyInfo."Phone No.")
            {
            }
            column(Company_VATRegistrationNo; tblCompanyInfo."VAT Registration No.")
            {
            }
            column(Company_Logo; tblCompanyInfo.Picture)
            {
            }
            column(SelltoCustomer_No; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomer_Name; "Sell-to Customer Name")
            {
            }
            column(Sellto_Address; "Sell-to Address")
            {
            }
            column(Sellto_Address2; "Sell-to Address 2")
            {
            }
            column(Sellto_Phone; "Sell-to Phone No.")
            {
            }
            column(Shipto_Name; "Ship-to Name")
            {
            }
            column(Shipto_Address; "Ship-to Address")
            {
            }
            column(Shipto_Address2; "Ship-to Address 2")
            {
            }
            column(Sellto_No; "No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(Salesperson; tblSalesPurchPerson.Name)
            {
            }
            //เลขที่ใบสั่งซื้อ

            dataitem(Line; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(Line_No; "Line No.")
                {
                }
                column(Line_Description; Description)
                {
                }
                column(Line_Quantity; Quantity)
                {
                }
                column(Line_UnitofMeasure; "Unit of Measure")
                {
                }
                column(Line_UnitPrice; "Unit Price")
                {
                }
                column(Line_Discount; "Line Discount %")
                {
                }
                column(Line_Amount; Amount)
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
        tblGLSetup: Record "General Ledger Setup";
        tblCompanyInfo: Record "Company Information";
        tblCust: Record Customer;
        tblPaymentTerms: Record "Payment Terms";
        tblSalesPurchPerson: Record "Salesperson/Purchaser";
}