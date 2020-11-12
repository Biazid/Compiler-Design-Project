@include st stdio.h gt

var_void function leftfb var_int pmt rightfb
leftsb
    iff leftfb pmt eqq 0 rightfb
    leftsb
    return
    rightsb
    elsee
    leftsb
        pmt jj
        pf leftfb pmt rightsb
    rightsb
rightsb

var_int main leftfb rightfb
leftsb
    var_int i=5
    var_int countt;
    var_string str;
    var_double dd;
    var_int arr lefttb 20 righttb;

    sf leftfb countt rightfb;

    iff leftfb i gt 4 and i st 15 rightfb
    leftsb
        pf leftfb $ NEUTRAL $ rightfb;
    rightsb

    eliff leftfb i neq 5 or i neq 6
    leftsb
        pf leftfb $ NOT $ rightfb ;
    rightsb

    elsee
    leftsb
        pf leftfb $ ELSE $ rightfb ;
    rightsb

    i eqq 0 ;
    rof  leftfb i:i+10:+ rightfb
    leftsb
        pf leftfb $ i $ rightfb
    rightsb

    i eqq i jog 4;
    i eqq i biyog 4;
    i eqq i goon 4;
    i eqq i vag 4;

    i joge 4;
    i biyoge 4;
    i goone 4;
    i vage 4;

    i jj;
    i bb;

    iff leftfb i eqq countt rightfb
    leftsb
        pf leftfb $ EQUAL $ rightfb;
    rightsb

    eliff leftfb i gt countt rightfb
    leftsb
        pf leftfb $ Greater $ rightfb ;
    rightsb

    elsee
    leftsb
        pf leftfb $ Smaller $ rightfb ;
    rightsb



rightsb
