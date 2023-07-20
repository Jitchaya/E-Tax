tableextension 50000 "Add VAT FRE" extends "VAT Product Posting Group"
{
    fields
    {
        field(100000; "VAT"; Option)
        {
            Caption = 'VAT';
            OptionMembers = VAT,FRE;
            //NotBlank = true;
        }
    }
}