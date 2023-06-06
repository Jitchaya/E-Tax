page 50000 "API List"
{
    Caption = 'API';
    PageType = List;
    ApplicationArea = All;
    CardPageID = "Api Card";
    UsageCategory = Administration;
    SourceTable = "API Body";
    Editable = false;
    // SourceTableView = WHERE("Document Type" = FILTER(Quote));

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
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
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin

                end;
            }
        }
    }
}