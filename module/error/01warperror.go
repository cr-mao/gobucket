package main

import (
	"fmt"
	"github.com/pkg/errors"
	"io/ioutil"
	"os"
	"path/filepath"
)

// 衍生goroutine
func Go(x func()) {
	go func() {
		defer func() {
			if err := recover(); err != nil {
				fmt.Println(err)
			}
		}()
		x()
	}()
}

func ReadFile(path string) ([]byte, error) {
	f, err := os.Open(path)
	if err != nil {
		return nil, errors.Wrap(err, "open failed")
	}
	defer f.Close()
	buf, err := ioutil.ReadAll(f)
	if err != nil {
		return nil, errors.Wrap(err, "read failed")
	}
	return buf, nil
}


func ReadConfig()([]byte,error) {
	home :=os.Getenv("HOME")
	config,err :=ReadFile(filepath.Join(home,".setting.xml"))
	return config,errors.WithMessage(err,"could not read config")
}

func main(){
	_,err :=ReadConfig()
	if err !=nil {
		fmt.Printf("original error:%T %v\n",errors.Cause(err),errors.Cause(err))
		fmt.Printf("stack stace :\n %+v\n",err)
		os.Exit(1)
	}
}


