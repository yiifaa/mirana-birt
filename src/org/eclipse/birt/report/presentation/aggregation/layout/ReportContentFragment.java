package org.eclipse.birt.report.presentation.aggregation.layout;

import org.eclipse.birt.report.presentation.aggregation.BirtBaseFragment;
import org.eclipse.birt.report.presentation.aggregation.control.NavigationbarFragment;

/**
 * Report content fragment containing engine fragment.
 * <p>
 * @see BaseFragment
 */
public class ReportContentFragment extends BirtBaseFragment
{
	/**
	 * Build fragment by adding engine fragment as child.
	 */
	protected void build( )
	{
		addChild(new NavigationbarFragment());
		addChild(new DocumentFragment());
	}
}
