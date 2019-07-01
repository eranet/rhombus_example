package main

import (
	"github.com/l1va/rhombus/gorhom"
)

type Position struct {
	Value float64
}

func main() {
	c := gorhom.LocalJSONConnection()
	defer c.Close()

	robot := "mymanip"
	joints := []string{//"base_revolute",
		"first_rotation", "second_rotation", "third_rotation", "fourth_rotation", "fifth_rotation"}

	rate := gorhom.NewRate(200)
	for i := 1.0; i > -1; i -= 0.001 {

		for _, name := range joints {
			err := c.Publish(robot+"/"+name+"/command", Position{Value: i})
			if err != nil {
				println("error pub:", err)
			}
		}
		rate.Sleep()
	}

	for i := -1.0; i < 1; i += 0.001 {

		for _, name := range joints {
			err := c.Publish(robot+"/"+name+"/command", Position{Value: i})
			if err != nil {
				println("error pub:", err)
			}
		}
		rate.Sleep()
	}
}
