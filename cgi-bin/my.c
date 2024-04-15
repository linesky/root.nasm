extern void putss(char *msg,int sizes );
extern int strlens(char *msg);
extern void exitss(int codes);

int main(){
   char *msgd="\x1b[43;37mhello world.\n";
   char *msgd2="hi.\n";
   int sizes = strlens(msgd);
   int sizes2 = strlens(msgd2);
   int rets = 0;
   putss(msgd,sizes);
   putss(msgd2,sizes2);
   exitss(rets);
   return 0;
   
}
