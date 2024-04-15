extern void putss(char *msg,int sizes );
extern void exitss(int codes);

int main(){
   char *msgd="\x1b[43;37mhello world.\n";
   char *msgd2="hi.\n";
   int sizes = 21;
   int sizes2 = 4;
   int rets = 0;
   putss(msgd,sizes);
   putss(msgd2,sizes2);
   exitss(rets);
   return 0;
   
}
