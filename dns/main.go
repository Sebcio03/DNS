package main

import (
	"fmt"

	"github.com/miekg/dns"
)

func handleRequest(w dns.ResponseWriter, r *dns.Msg) {
	client := new(dns.Client)
	message := new(dns.Msg)

	in, _, err := client.Exchange(r, "8.8.8.8:53")
	if err != nil {
		fmt.Println(err)
		err = w.WriteMsg(message)
		if err != nil {
			fmt.Println(err)
		}
	}
	err = w.WriteMsg(in)
	if err != nil {
		fmt.Println(err)
	}
}

func main() {
	dns.HandleFunc(".", handleRequest)
	server := &dns.Server{Addr: ":153", Net: "udp"}
	err := server.ListenAndServe()
	if err != nil {
		fmt.Println(err)
	}
}
