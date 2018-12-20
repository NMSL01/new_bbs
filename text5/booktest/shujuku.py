import sys 
import random
sys.path.append("/home/wanghuo/mygit/django/text5/booktest")
import models
def main():
    new=models.mymodel()
    text=['胡凯莉',"五五开","太原马超","大司马","杨超越","神超"]
    for i in range(25):
        index=random.randint(0,5)
        name=text[index]+str(i)
        s=new.create(name,str(i*30))
        s.save()

if __name__=="__main__":
    main()