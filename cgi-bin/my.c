extern void clearss();
extern void strs(int value,int strss);
extern void putss(int msg);
extern void prints(int msg);
extern void fputss(int msg,int handler );
extern void fgetss(int msg,int sizes,int handler );
extern void writess(int msg,int sizes,int handler );
extern int creatss(int msg,int acesss );
extern int openss(int msg,int acesss ,int permition );
extern int closess(int handler );
extern int strlens(int msg);
extern int strcps(int msg,int msg2);
extern int strncps(int msg,int msg2,int counts);
extern int strcats(int msg,int msg2);
extern void exitss(int codes);
extern int memcps(int msg,int msg2,int counts);
extern int memfills(int msg,int counts,char msg2);
extern int getout();
extern int getesp();
extern int getin();
extern int getreadss();
extern int getwritess();
extern int getreadwritess();
extern int strchrreplace(int msg,char msg2,char msg3);
const char *returner(char *c){
   return (const char *)c;

}
int address(char *c){
    int i=0;
    char *cc;
    i=(int) c;
    return i;
    cc=(char*)i;
    //return cc;

}

int main(){
   char *msgd="\x1b[43;37m";
   char *msgd3="hello world";
   char msgd2[1080];
   int sizes = strlens(address(msgd));
   int rets = 0;
   int outs=getout();
   int ins=getin();
   rets=getesp();
   clearss();
   memfills(address(msgd2),1000,'\0');
   msgd2[80]=0;
   strcps(address(msgd2),address(msgd));
   strcats(address(msgd2),address(msgd3));
   sizes = strlens(address(msgd2));
   putss(address(msgd2));
   
   return 0;
   
}
