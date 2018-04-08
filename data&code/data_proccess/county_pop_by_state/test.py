#coding=utf-8
import os

files = os.listdir("C:\Users\lenovo\Desktop\data_proccess\county_pop_by_state")#列出当前目录下所有的文件
files = files[:-1]
for file in files:
    file = file[1:]
    file = file[0]
    #file = int(file[0])
print files

sum = open('sum.txt', 'w')
for i in range(56):
    try:
        content = open('{0}.txt'.format((i+1)), 'r')
        content = content.read()
        sum.write(content)
    except:
        pass
sum.close()


'''#coding=utf-8
import os
#获取目标文件夹的路径
filedir = os.getcwd()+'/yuliao'
#获取当前文件夹中的文件名称列表
filenames=os.listdir(filedir)
#打开当前目录下的result.txt文件，如果没有则创建
f=open('result.txt','w')
#先遍历文件名
for filename in filenames:
    filepath = filedir+'/'+filename
    #遍历单个文件，读取行数
    for line in open(filepath):
        f.writelines(line)
        f.write('\n')
#关闭文件
f.close()'''