# A Simple "sorting" class

- returns a string (configurable by specifying a yaml configuration file of the format shown in `config.yml` )

## Usage

```
sorter = Sorter.new(config_file: '<path/to/config/file.yml>')

sorter.sort(2, 3, 4, 10)

=> "STANDARD"  # when using the default config file provided in config.yml
```

## Testing

```
./test.sh

=>
........

Finished in 0.00342 seconds (files took 0.07626 seconds to load)
8 examples, 0 failures
```
