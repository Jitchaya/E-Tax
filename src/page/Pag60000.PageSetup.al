page 60000 "Page Setup"
{
    //AdditionalSearchTerms = 'Setup';
    ApplicationArea = all;
    Caption = 'API Page Setup';
    DeleteAllowed = false;
    //InsertAllowed = false;
    Editable = true;
    PageType = Card;
    //QueryCategory = 'Page Setup';
    SourceTable = "API Setup";
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'API Setup';
                field("id"; Rec.idHeader)
                {
                    Caption = 'idHeader';
                    ApplicationArea = All;
                    //Visible = false;
                }
                field("Content-Type"; Rec."Content-Type")
                {
                    Caption = 'Content-Type';
                    ApplicationArea = All;
                }
                field("Authorization"; Rec."Authorization")
                {
                    Caption = 'Authorization';
                    ApplicationArea = All;
                    //Visible = false;
                }
                field("SellerTaxId"; Rec."SellerTaxId")
                {
                    Caption = 'SellerTaxId';
                    ApplicationArea = All;
                }
                field("SellerBranchId"; Rec."SellerBranchId")
                {
                    Caption = 'SellerBranchId';
                    ApplicationArea = All;
                }
                field("APIKey"; Rec."APIKey")
                {
                    Caption = 'APIKey';
                    ApplicationArea = All;
                }
                field("UserCode"; Rec."UserCode")
                {
                    Caption = 'UserCode';
                    ApplicationArea = All;
                }
                field("AccessKey"; Rec."AccessKey")
                {
                    Caption = 'AccessKey';
                    ApplicationArea = All;
                }
                field("ServiceCode"; Rec."ServiceCode")
                {
                    Caption = 'ServiceCode';
                    ApplicationArea = All;
                }
                field("TextContent"; Rec."TextContent")
                {
                    Caption = 'TextContent';
                    ApplicationArea = All;
                }
                field("PDFContent"; Rec."PDFContent")
                {
                    Caption = 'PDFContent';
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

    var
        myInt: Integer;
}