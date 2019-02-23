/*
 * HPNPreprocessorUtils.h
 * happn
 *
 * Created by François Lamboley on 1/10/18.
 * Copyright © 2018 happn. All rights reserved.
 */

#ifndef HPNPreprocessorUtils_h
# define HPNPreprocessorUtils_h


/* Stringification */
# define _sharp(x) #x
# define S(x) _sharp(x)


/* Static assert */
# define STATIC_ASSERT(test, msg) typedef char _static_assert_##msg[((test)? 1: -1)]


#endif /* HPNPreprocessorUtils_h */
