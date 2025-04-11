# Shiori Add-on for Home Assistant

This is a custom Home Assistant add-on for [Shiori](https://github.com/go-shiori/shiori), a simple self-hosted bookmark manager.

## Configuration

```yaml
port: 8080
```

The web UI will be accessible at `http://<home_assistant_host>:<port>`.

## Data Persistence

All data is stored in `/data`, so it will be included in Home Assistant's full backup system.
