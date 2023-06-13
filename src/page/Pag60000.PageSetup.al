page 60000 "Page Setup"
{
    //AdditionalSearchTerms = 'Setup';
    ApplicationArea = All;
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
            field(Method; Rec.Method)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Method field.';
            }
            field(URL; Rec.URL)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the URL field.';
            }
            group(General)
            {
                Caption = 'API Setup';
                field("id"; Rec."Primary Key")
                {
                    Caption = 'Primary Key';
                    ApplicationArea = All;
                    Visible = false;
                }
                /*field("Authorization"; Rec."Authorization")
                {
                    Caption = 'Authorization';
                    ApplicationArea = All;
                    //Visible = false;
                }*/
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
                    Visible = false;
                }
                field("PDFContent"; Rec."PDFContent")
                {
                    Caption = 'PDFContent';
                    ApplicationArea = All;
                }
            }
            group(Header)
            {
                field("Authorization Type"; Rec."Authorization Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Authorization Type field';
                    trigger OnValidate()
                    var
                    // myInt: Integer;
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Content-Type"; Rec."Content-Type")
                {
                    Caption = 'Content-Type';
                    ApplicationArea = All;
                }
                field(Authorization; Rec."Authorization")
                {
                    //Visible = (Rec."Authorization Type" = Rec."Authorization Type"::"Brearer Token");
                    ApplicationArea = All;
                    ToolTip = 'Value of the Authorization field.';
                }
                field("Content Format"; Rec."Content Format")
                {
                    Caption = 'Content Format';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("API Setup")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'E-TAX';
                Image = AccountingPeriods;
                RunObject = Page "API Card";
                ToolTip = 'Set up API CARD';
            }
            /*action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }*/
        }
        area(Promoted)
        {
            /*group(Category_Category4)
           {
               Caption = 'API Card', Comment = 'Generated from the PromotedActionCategories property index 3.';

               actionref("Customer Posting Groups_Promoted"; "API Card")
               {
               }
           }*/
        }
    }

    var
        myInt: Integer;
}