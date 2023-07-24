page 80002 "Save Logs Card"
{
    Caption = 'Save Logs Card';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "API Response";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    layout
    {
        area(Content)
        {
            field(EntryNo; Rec.EntryNo)
            {
                ApplicationArea = All;
                Caption = 'No.';
                ToolTip = 'No.';
            }
            field(Method; Rec.Method)
            {
                ApplicationArea = All;
                ToolTip = 'Method';
            }
            field(ETaxID; Rec.ETaxID)
            {
                ApplicationArea = All;
                ToolTip = 'Entry Number';
            }
            field(URL; Rec.URL)
            {
                ApplicationArea = All;
                ToolTip = 'URL';
            }
            field(Response; m_Response)
            {
                ApplicationArea = All;
                ToolTip = 'Response';

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
            field(InvoiceNumber; Rec.InvoiceNumber)
            {
                ApplicationArea = All;
                ToolTip = 'Invoice Number';
            }
            field(Output; Rec.Output)
            {
                ApplicationArea = All;
                ToolTip = 'Output field';
            }
            field(JsonBody; m_JsonBody)
            {
                ApplicationArea = All;
                ToolTip = 'JsonBody field';
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Sale Invoice")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Show Posted Sale Invoice';
                Image = ShowList;
                RunObject = Page "Posted Sales Invoice";
                RunPageLink = "No." = field(InvoiceNumber);
                ToolTip = 'Show Posted Sales Invoice CARD';
            }
        }
    }
    var
        m_Response: Text;
        m_JsonBody: Text;

    trigger OnAfterGetRecord()

    begin
        m_Response := Rec.GetResponseBlob();
        m_JsonBody := Rec.GetJsonBodyBlob();
    end;
}