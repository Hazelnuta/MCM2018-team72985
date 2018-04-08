import xlrd

class charger:
    def __init__(self, attr = [], lati = 0, longi = 0, isOpen = 1, num = 0):
        self.attr = attr
        self.lati = lati
        self.longi = longi
        self.isOpen = isOpen
        self.num = num

def filter(file):
    global count
    book = xlrd.open_workbook(file)
    sheet = book.sheet_by_name("Worksheet")
    i = 1
    while True:
        try:
            attr = []
            for j in range(4):
                if sheet.cell_value(i, j + 1) == '':
                    continue
                attr.append(sheet.cell_value(i, j + 1))
            i = i + 1
            lati = sheet.cell_value(i, 6)
            longi = sheet.cell_value(i, 7)
            isOpen = 1 - sheet.cell_value(i, 5)
            #print attr
            count += 1
            chg = charger(attr, lati, longi, isOpen, count)
            charger_set.append(chg)
        except IndexError:
            break

count = 0
charger_set = []
filter("charger_info1.xls")
print count
filter("charger_info2.xls")
print count
filter("charger_info3.xls")
print count
filter("charger_info4.xls")
print count

destination_open_file = open('destination_open_file.txt', 'w')
super_open_file = open('super_open_file.txt', 'w')
destination_nopen_file = open('destination_nopen_file.txt', 'w')
super_nopen_file = open('super_nopen_file.txt', 'w')
for charger in charger_set:
    try:
        if charger.isOpen == 1:
            if "destination charger" in charger.attr:
                destination_open_file.write(str(charger.num) + '\t')
                destination_open_file.write(str(charger.lati) + '\t')
                destination_open_file.write(str(charger.longi) + '\n')
            if "supercharger" in charger.attr:
                super_open_file.write(str(charger.num) + '\t')
                super_open_file.write(str(charger.lati) + '\t')
                super_open_file.write(str(charger.longi) + '\n')
        if charger.isOpen == 0:
            if "destination charger" in charger.attr:
                destination_nopen_file.write(str(charger.num) + '\t')
                destination_nopen_file.write(str(charger.lati) + '\t')
                destination_nopen_file.write(str(charger.longi) + '\n')
            if "supercharger" in charger.attr:
                super_nopen_file.write(str(charger.num) + '\t')
                super_nopen_file.write(str(charger.lati) + '\t')
                super_nopen_file.write(str(charger.longi) + '\n')
    except:
        print str(charger.latitude)

destination_open_file.close()
super_open_file.close()
destination_nopen_file.close()
super_nopen_file.close()
