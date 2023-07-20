pageextension 70000 "MyExtension" extends "VAT Product Posting Groups"
{
    layout
    {
        addlast(Control1)
        {
            field(VAT; Rec.VAT)
            {
                ApplicationArea = all;
            }
        }
    }
}