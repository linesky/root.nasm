extern void putss(char *msg,int sizes );
extern void prints(char *msg,int sizes );
extern void fputss(char *msg,int sizes,int handler );
extern void writess(char *msg,int sizes,int handler );
extern int strlens(char *msg);
extern int strcps(char *msg,char *msg2);
extern int strncps(char *msg,char *msg2,int counts);
extern int strcats(char *msg,char *msg2);
extern void exitss(int codes);
extern int memcps(char *msg,char *msg2,int counts);
extern int memfills(char *msg,int counts,char msg2);
int stdouts=1;
int main(){
   char *msgd="\x1b[43;37m";
   char msgd2[1080];
   int sizes = strlens(msgd);
   prints(msgd,sizes);
   int rets = 0;
   prints(msgd,sizes);
   sizes = 80;
   memfills(msgd2,sizes,'*');
   prints(msgd2,sizes);
   exitss(rets);
   return 0;
   
}
