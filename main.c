#include <stdio.h>
#include <string.h>
#include <caml/mlvalues.h>
#include <caml/callback.h>
#include <stdbool.h>

bool mac(long n){
        static const value *mac_closure = NULL;
        if(mac_closure == NULL)
                mac_closure = caml_named_value("verifyingmac");
        return Bool_val(caml_callback(*mac_closure, Val_long(n)));
}

int main(int arg, char ** argv){
        int result;
        caml_startup(argv);
        result = mac(0x000000000000);
	printf("result = %d\n", result);
        return 0;
}
