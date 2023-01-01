package helloworld

import "context"

type Binding struct {
	UnimplementedGreeterServer
}

func (s *Binding) SayHello(ctx context.Context, r *HelloRequest) (*HelloResponse, error) {
	return &HelloResponse{
		Message: "hello " + r.Name,
	}, nil
}
