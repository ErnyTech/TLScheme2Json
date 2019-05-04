module dscheme;

import tlscheme2json;
enum DEFAULT_SCHEME_URL = "https://raw.githubusercontent.com/ErnyTech/TLScheme2Json/master/TLScheme.json";

class DScheme {
    private static TLClass[] tlClasses;

    static this() {
        import std.stdio : writeln;
        import std.net.curl : get;
        import asdf : deserialize;
 
        writeln("Obtaining TLScheme Json from " , DEFAULT_SCHEME_URL);
        auto jsonScheme = get(DEFAULT_SCHEME_URL).dup;
        auto tljson = deserialize!TLJson(jsonScheme);
        this.tlClasses = tljson.tl_classes;
    }

    static TLClass get() {
        return this.tlClasses;
    }
}