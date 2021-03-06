
#!/bin/bash

#You can use these ANSI escape codes:

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37


RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
LIGHTBLUE='\033[1;34m'
NC='\033[0m' # No Color
COLOR=${LIGHTBLUE}
C1=${BLUE}


# Heading Functions
aaa_h1(){
    echo -e "${COLOR}\n\n##    $h1 ${NC}"
    echo -e "${COLOR}##    ===========================================\n${NC}"
}

aaa_h2(){
    echo -e "${C1}##  $h2 ${NC}"
}



a01_Create_the_Dirs() {
    h1="a01_Create_the_Dir ";aaa_h1
    rm -rf src
    rm -rf mods
    mkdir -p src/com.greetings/com/greetings/
    mkdir -p mods/com.greetings
    tree
}


a02_create_module_file(){
    h1="a02_create_module_file  ";aaa_h1
    
cat << EOF > src/com.greetings/module-info.java
module com.greetings { }
EOF
    
    tree -L 2 src/
    nl src/com.greetings/module-info.java
    echo
}


a03_create_the_Main_file() {
    h1="a03_create_the_Main_file ";aaa_h1
cat << EOF > src/com.greetings/com/greetings/Main.java
    package com.greetings;
    public class Main {
        public static void main(String[] args) {
            System.out.println("Greetings!");
        }
    }
EOF
    
    tree src/com.greetings/com/greetings/
    nl src/com.greetings/com/greetings/Main.java
    
}

a04_create_the_modules() {
    h1="a04_create_the_modules ";aaa_h1
    echo -e "We will be createin the class files"
    tree  mods
    
    javac -d mods/com.greetings \
    src/com.greetings/module-info.java \
    src/com.greetings/com/greetings/Main.java
    
    tree mods
}
a05_run_the_modules(){
    h1="a05_run_the_modules()";aaa_h1
    
    java --module-path mods --module com.greetings/com.greetings.Main
    
    
    echo -e  "
$ java --module-path mods
       --module com.greetings/com.greetings.Main

* --module-path is the module path, its value is one or more directories
  that contain modules.
* The -m option specifies the main module,
    * the value after the slash is the class name of the main class in the module"
}

a01_Create_the_Dirs
a02_create_module_file
a03_create_the_Main_file
a04_create_the_modules
a05_run_the_modules
