# Implementation 
## Upgrade steops

Check available Ruby versions:
```
$ rbenv install -l
3.1.7
3.2.8
3.3.8
3.4.3
```

Update `.ruby-version` file:
```
3.2.8
```

Update `Gemfile`:
```
ruby '3.2.8'
```   

```
$ asdf current         
Name            Version         Source                                                              Installed
ruby            3.2.8           /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/.ruby-version true
```

```
$ bundle install
No version is set for command bundle
Consider adding one of the following versions in your config file at /Users/nguyen.tung.trang/Work/repo/tax_adjustment_web/.tool-versions
ruby 3.1.4% 
```

# Upgrade Ruby from 3.1.4 to 3.2.8

To upgrade Ruby from 3.1.4 to 3.2.8, follow these steps:

1. Update your Ruby version in the Gemfile:
```Gemfile
ruby '3.2.8'
```

2. Update Ruby in your environment using a version manager:
   - With rbenv: `rbenv install 3.2.8 && rbenv local 3.2.8`
   - With RVM: `rvm install 3.2.8 && rvm use 3.2.8`
   - With asdf: `asdf install ruby 3.2.8 && asdf local ruby 3.2.8`

3. Update your dependencies:
   ```
   bundle update
   ```

4. Check for compatibility issues in your test suite:
   ```
   bundle exec rspec
   ```
# Ruby 3.1.4 to 3.2.8 Changes

## Major Features and Changes

1. **WASI-based WebAssembly Support**
   - Ruby now runs on WebAssembly environments
   - Reference: https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/#wasi-based-webassembly-support

2. **Data Class**
   - New built-in `Data` class for immutable value objects
   - Reference: https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/#data-class

3. **Regexp Engine (Onigmo → Regint)**
   - Improved performance for regular expressions
   - Reference: https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/#regexp-improvements

4. **YJIT Improvements**
   - Substantial performance improvements and reduced memory usage
   - Now enabled by default in Ruby 3.2
   - Reference: https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/#yjit-improvements

5. **GC Improvements**
   - Variable Width Allocation for better memory management
   - Reference: https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/#gc-improvements

## Potential Impact Areas

1. **Language Syntax and Semantics**
   - Pattern matching with `Data` class
   - `SyntaxError` for keyword arguments with non-symbol keys is now enforced

2. **Standard Library Changes**
   - `Set` is now available without requiring it
   - `Pathname.` new methods for path manipulation
   - Several date/time handling improvements

3. **Deprecations**
   - `Kernel#pp` auto-loading is deprecated
   - `Kernel#eval` without proper binding/filename arguments is deprecated
   - `Psych.safe_load` vs `Psych.unsafe_load` changes

4. **Rails Compatibility**
   - Rails 7.0.8+ is fully compatible with Ruby 3.2
   - Some gems in your Gemfile might need updates

## Mitigation Strategies

1. **Test Thoroughly**
   - Run your entire test suite with Ruby 3.2.8
   - Pay special attention to regexp-heavy code

2. **Dependency Updates**
   - Update all gems, particularly:
     - `puma` (ensure you're using 5.6.5+)
     - `mysql2` (may need updates for Ruby 3.2)
     - `sidekiq` and `sidekiq-pro`

3. **Rails Upgrade**
   - Ensure you're on Rails 7.0.8+ for best compatibility

4. **Code Changes**
   - Update any deprecated syntax patterns
   - Replace non-symbol keys in keyword arguments

## Reference Documentation

- [Ruby 3.2.0 Release Notes](https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/)
- [Ruby 3.2.1 to 3.2.8 Release Notes](https://www.ruby-lang.org/en/downloads/releases/)
- [Ruby 3.2 Breaking Changes](https://rubyreferences.github.io/rubychanges/3.2.html)
- [Ruby Issue Tracker](https://bugs.ruby-lang.org/projects/ruby-master/issues)
- [Rails on Ruby 3.2 Compatibility Guide](https://guides.rubyonrails.org/upgrading_ruby_on_rails.html)

### Releases

[Release Notes](https://www.ruby-lang.org/en/downloads/releases/)
[What's Changed to 3.2.8](https://github.com/ruby/ruby/releases)

### Tags
#### Ruby 3.1.7 Released

https://www.ruby-lang.org/en/news/2025/03/26/ruby-3-1-7-released/

#### Ruby 3.2.8 Released

https://www.ruby-lang.org/en/news/2025/03/26/ruby-3-2-8-released/

[Github tag](https://github.com/ruby/ruby/releases/tag/v3_2_8)

[Github compare](https://github.com/ruby/ruby/compare/v3_1_4...v3_2_8)

#### Security advisories: CVE-2025-27219, CVE-2025-27220 and CVE-2025-27221

https://www.ruby-lang.org/en/news/2025/02/26/security-advisories/