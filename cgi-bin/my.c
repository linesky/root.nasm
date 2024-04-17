extern void clearss();
extern void strs(int value,char *strss);
extern void putss(char *msg);
extern void prints(char *msg);
extern void fputss(char *msg,int handler );
extern void fgetss(char *msg,int sizes,int handler );
extern void writess(char *msg,int sizes,int handler );
extern int creatss(char *msg,int acesss );
extern int openss(char *msg,int acesss ,int permition );
extern int closess(int handler );
extern int strlens(char *msg);
extern int strcps(char *msg,char *msg2);
extern int strncps(char *msg,char *msg2,int counts);
extern int strcats(char *msg,char *msg2);
extern void exitss(int codes);
extern int memcps(char *msg,char *msg2,int counts);
extern int memfills(char *msg,int counts,char msg2);
extern int getout();
extern int getesp();
extern int getin();
extern int getreadss();
extern int getwritess();
extern int getreadwritess();
extern int strchrreplace(char *msg,char msg2,char msg3);
 
int main(){
   char *msgd="\x1b[43;37m";
   char *msgd3="1234567890";
   char msgd2[1080];
   int sizes = strlens(msgd);
   int rets = 0;
   int outs=getout();
   int ins=getin();
   rets=getesp();
   clearss();
   memfills(msgd2,1000,'\0');
   strcps(msgd2,msgd);
   strcats(msgd2,msgd3);
   sizes = strlens(msgd2);
   prints(msgd);
   for(rets=0;rets<16;rets++){
   strs(rets,msgd2);
   
        prints(msgd2);
   }
   return 0;
   
}
