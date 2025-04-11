# Upgrade Ruby from 3.1.4 to 3.2.4
To upgrade Ruby from 3.1.4 to 3.2.4, follow these steps:

1. Update your Ruby version in the Gemfile:
```Gemfile
ruby '3.2.4'
```

2. Update Ruby in your environment using a version manager:
   - With rbenv: `rbenv install 3.2.4 && rbenv local 3.2.4`
   - With RVM: `rvm install 3.2.4 && rvm use 3.2.4`
   - With asdf: `asdf install ruby 3.2.4 && asdf local ruby 3.2.4`

3. Update your dependencies:
   ```
   bundle update
   ```

4. Check for compatibility issues in your test suite:
   ```
   bundle exec rspec
   ```

To list changes between Ruby 3.1.4 and 3.2.4, you can:

1. Review the official Ruby documentation:
   - Ruby 3.2 release notes: https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/
   - Subsequent point releases: check the Ruby news page

2. Key changes in Ruby 3.2:
   - WASI based WebAssembly support
   - Data types for pattern matching
   - Improved Regexp performance with new engine (Onigmo → Regint)
   - Improved YJIT compiler
   - Performance improvements in garbage collection

3. For a detailed changelog, run:
   ```
   git clone https://github.com/ruby/ruby.git
   cd ruby
   git log --pretty=format:"%h - %s" v3_1_4...v3_2_4
   ```

# Ruby 3.1.4 to 3.2.5 Changes

## Major Features & Changes

### Ruby 3.2.0 (Major Update)
- **WASI-based WebAssembly support**: Run Ruby in browsers and WebAssembly environments
- **New Data class**: Immutable data-holding class for pattern matching
- **Regexp engine upgrade**: Migrated from Onigmo to Regint with better performance
- **YJIT improvements**: Faster warmup, reduced memory usage, stable arm64 support
- **Improved GC performance**: More efficient object allocation and memory management

### Point Releases (3.2.1-3.2.5)
- **Security fixes**: Various CVE patches for ReDoS vulnerabilities
- **Performance optimizations**: Continued YJIT improvements
- **Bug fixes**: Platform-specific issues and standard library corrections

## Potential Impact Areas

### Deprecations & Breaking Changes
- `Kernel#expr`: Now warns, will be removed in 3.3
- `Symbol#to_proc` no longer special-cases certain optimization patterns
- Changes to `Coverage` API and behavior
- Refinements behavior changes with method cache

### Compatibility Concerns
- **Dependencies**: Some gems may not be compatible with 3.2.x initially
- **YJIT-specific issues**: Potential memory usage changes with YJIT enabled
- **C extensions**: May need recompilation or updates

## Reference Documentation

### Official Resources
- [Ruby 3.2.0 Release Notes](https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/)
- [Ruby 3.2.1-3.2.5 Release Notes](https://www.ruby-lang.org/en/downloads/releases/)
- [Ruby NEWS file](https://github.com/ruby/ruby/blob/master/NEWS.md)

### Migration Guides
- [Ruby on Rails Upgrade Guide](https://guides.rubyonrails.org/upgrading_ruby_on_rails.html)
- [JRuby Compatibility](https://github.com/jruby/jruby/wiki/Compatibility)

### Testing Strategies
- Run test suite with warnings enabled (`-W` flag)
- Use RuboCop with `--only Migration/Ruby32` to catch deprecations
- Implement CI tests on both Ruby versions before upgrading production


# Releases

[Release Notes](https://www.ruby-lang.org/en/downloads/releases/)
[What's Changed to 3.2.8](https://github.com/ruby/ruby/releases)

## Tags
### Ruby 3.1.7 Released

https://www.ruby-lang.org/en/news/2025/03/26/ruby-3-1-7-released/

### Ruby 3.2.8 Released

https://www.ruby-lang.org/en/news/2025/03/26/ruby-3-2-8-released/

[Github tag](https://github.com/ruby/ruby/releases/tag/v3_2_8)

[Github compare](https://github.com/ruby/ruby/compare/v3_1_4...v3_2_8)

### Security advisories: CVE-2025-27219, CVE-2025-27220 and CVE-2025-27221

https://www.ruby-lang.org/en/news/2025/02/26/security-advisories/