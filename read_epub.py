__author__ = 'User'


import epub
import re
from xml.etree import ElementTree
from cStringIO import StringIO

class AllEntities:
    def __getitem__(self, key):
        # key is your entity, you can do whatever you want with it here
        if key == "nbsp":
            return ""
        return key

book = epub.open_epub('book.epub')
first_file_name = book.toc.nav_map.nav_point[5].src
print first_file_name

chapter = book.open(first_file_name)  # Open from zip
string = chapter.read()
print(string[:75])

first_file = StringIO(string)
parser = ElementTree.XMLParser();
parser.parser.UseForeignDTD(True); # because ElementTree chokes on &nbsp;
parser.entity = AllEntities()

etree = ElementTree.ElementTree()
tree = etree.parse(first_file, parser=parser)

lines = list(tree)[1].itertext()

for line in lines:
    striped_line = re.sub('[,.?]', '', line)
    print striped_line
