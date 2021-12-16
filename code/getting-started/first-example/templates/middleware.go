package main

import (
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	"github.com/labstack/echo-contrib/prometheus"
)

func setupMiddleware(e *echo.Echo) error {
	// setup recovery middleware
	e.Use(middleware.Recover())

	{{ if .SERVER.Prometheus }}
	// Setup metrics middleware
	p := prometheus.NewPrometheus("{{ .SERVER.Name }}", nil)
	e.Use(p.HandlerFunc)
	{{ end }}

	// setup auth middleware (see full-example)

	return nil
}

