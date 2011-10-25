package module.metaWorkflow.presentationTier.provider;

import java.util.Comparator;
import java.util.Set;
import java.util.TreeSet;

import module.metaWorkflow.domain.MetaField;
import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;
import pt.ist.fenixframework.FenixFramework;
import dml.DomainClass;

public class MetaFieldClassProvider implements DataProvider {

    public static Comparator<Class<?>> CLASS_COMPARATOR_BY_SIMPLE_NAME_OR_FULL_PACKAGE_NAME = new Comparator<Class<?>>() {
	@Override
	public int compare(Class<?> class0, Class<?> class1) {
	    int comparison = class0.getSimpleName().compareTo(class1.getSimpleName());
	    if (comparison != 0) {
		return comparison;
	    }
	    return class0.getName().compareTo(class1.getName());
	}
    };

    @Override
    public Object provide(Object source, Object currentValue) {
	Set<Class<? extends MetaField>> metaFieldClasses = new TreeSet<Class<? extends MetaField>>(
		CLASS_COMPARATOR_BY_SIMPLE_NAME_OR_FULL_PACKAGE_NAME);
	for (DomainClass domainClass : FenixFramework.getDomainModel().getDomainClasses()) {
	    if (isSubclassOfMetaField(domainClass)) {
		try {
		    metaFieldClasses.add((Class<? extends MetaField>) Class.forName(domainClass.getFullName()));
		} catch (ClassNotFoundException ex) {
		    throw new RuntimeException("Domain class not found: " + domainClass.getFullName(), ex);
		}
	    }
	}
	return metaFieldClasses;
    }

    private boolean isSubclassOfMetaField(DomainClass domainClass) {
	return (domainClass.hasSuperclass() && domainClass.getSuperclass().getFullName().equals(MetaField.class.getName()));
    }

    @Override
    public Converter getConverter() {
	return null;
    }
}
