%hookf(char *, getenv, const char *name) {
    if (!name) return %orig;
    NSString *key = [NSString stringWithUTF8String:name];

    if (key && ([key isEqualToString:@"DYLD_INSERT_LIBRARIES"] ||
        [key hasPrefix:@"_"])) return NULL;

    return %orig;
}