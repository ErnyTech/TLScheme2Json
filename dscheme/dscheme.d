module dscheme;

import tlscheme2json;

class DScheme {
    private static TLClass[] tlClasses;

    static this() {
        import asdf : deserialize;
 
        auto parser = new TLScheme2Json();
        parser.parse;
        auto jsonScheme = parser.toJson;
        auto tljson = deserialize!TLJson(jsonScheme);
        this.tlClasses = tljson.tl_classes;
    }

    static TLClass get() {
        return this.tlClasses;
    }
}
