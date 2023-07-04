report 50100 "TRN_Customer List"
{
    Caption = 'ReportName';
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'src\reportlayout\Rep50100.TRN_CustomerList.rdl';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {

            }
            column(Name; Name)
            {

            }
            column(Address; Address)
            {

            }
            column(Credit_Limit_LCY; "Credit Limit (LCY)")
            {

            }
            column(Last_Date_Modified; "Last Date Modified")
            {

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