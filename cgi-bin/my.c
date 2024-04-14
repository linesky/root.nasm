extern void putss(char *msg,int sizes );
extern void exitss(int codes);

int main(){
   char *msgd="\x1b[43;37mhello world.\n";
   int sizes = 20;
   int rets = 0;
   putss(msgd,sizes);
   exitss(rets);
   return 0;
   
}
