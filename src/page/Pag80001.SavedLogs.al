page 80001 "Saved Logs"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "API Response";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                /*field(idHeader; Rec.idHeader)
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    ToolTip = 'No.';
                }*/
                field(Method; Rec.Method)
                {
                    ApplicationArea = All;
                    ToolTip = 'Method';
                }
                field(URL; Rec.URL)
                {
                    ApplicationArea = All;
                    ToolTip = 'URL';
                }
                field("Authorization Type"; Rec."Authorization Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Authorization Type';
                }
                field("Content-Type"; Rec."Content-Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Content-Type';
                }
                field(Output; Rec.Output)
                {
                    ApplicationArea = All;
                    ToolTip = 'Output field';
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

                trigger OnAction();
                begin

                end;
            }
        }
    }
}