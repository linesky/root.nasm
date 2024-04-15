extern void putss(char *msg,int sizes );
extern int strlens(char *msg);
extern int strcps(char *msg,char *msg2);
extern int strncps(char *msg,char *msg2,int counts);
extern int strcats(char *msg,char *msg2);
extern void exitss(int codes);

int main(){
   char *msgd="\x1b[43;37mhello world.\n";
   char msgd2[1080];
   int sizes = 10;
   int rets = 0;
   strncps(msgd2,msgd,sizes);
   
   sizes = strlens(msgd2);
   putss(msgd2,sizes);
   exitss(rets);
   return 0;
   
}
