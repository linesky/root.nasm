extern void putss(char *msg,int sizes );
extern int strlens(char *msg);
extern int strcps(char *msg,char *msg2);
extern int strcats(char *msg,char *msg2);
extern void exitss(int codes);

int main(){
   char *msgd="\x1b[43;37mhello world.\n";
   char *msgd3="hi.\n";
   char msgd2[1080];
   int sizes = strlens(msgd);
   int rets = 0;
   strcps(msgd2,msgd);
   strcats(msgd2,msgd3);
   sizes = strlens(msgd2);
   putss(msgd2,sizes);
   exitss(rets);
   return 0;
   
}
