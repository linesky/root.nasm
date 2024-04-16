extern void putss(char *msg,int sizes );
extern void prints(char *msg,int sizes );
extern void fputss(char *msg,int sizes,int handler );
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
extern int getin();
extern int getreadss();
extern int getwritess();
extern int getreadwritess();
extern int strchrreplace(char *msg,char msg2,char msg3);
 
int main(){
   char *msgd="\x1b[43;37mfile my.txt.\n";
   char *files="my.txt";
   int f1=0;
   char msgd2[1080];
   int sizes = strlens(msgd);
   int rets = 0;
   int outs=getout();
   int ins=getin();
   prints(msgd,sizes);
   memfills(msgd2,82,'*');
   f1=creatss(files,0777);
   fputss(msgd2,80,f1);
   closess(f1);
   memfills(msgd2,82,' ');
  f1=openss(files,0777,getreadss());
   fgetss(msgd2,80,f1);
   closess(f1);
   fputss(msgd2,80,ins);
   exitss(rets);
   return 0;
   
}
